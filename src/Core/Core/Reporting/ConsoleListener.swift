public class ConsoleListener : Listener {
  
  public class Printer {
    public var out: String -> Void = println
    public var indentLevel = 0
    
    func print(output: String) {
      var indentation = ""
      
      if(indentLevel > 0) {
        for _ in 1...indentLevel { indentation += "  " }
      }
      
      out(indentation + output)
    }
    
    func lineBreak() { out("") }
    func indent() { indentLevel += 1 }
    func dedent() { indentLevel -= 1 }
  }
  
  public var printer = Printer()
  var passedCount = 0
  var failedExamples : [Example] = []
  var pendingCount = 0
  var offset = 0
  
  public override init() { super.init() }
  
  public override func suiteFinished() {
    printer.lineBreak()
    
    for ex in failedExamples {
      printer.print("× \"\(ex.subject)\" failed:")
      printer.indent()
      
      for exp in ex.expectations.filter(Status.equals(.Fail)) {
        printer.print("\(exp.msg) (\(exp.cursor.relativePath()):\(exp.cursor.line))")
      }
      
      printer.lineBreak()
      
      printer.dedent()
    }
    
    printer.print(
      ":: RESULTS :: completed in \(Swiftest.timer.toString())s\n" +
        "✓ \(passedCount)/\(runCount()) examples passed :: " +
        "× \(failedExamples.count) failed :: " +
      "★ \(pendingCount) pending\n"
    )
  }
  
  public override func specFinished(spec: Specification) {
    if spec.parents.isEmpty { printSpec(spec) }
  }
  
  func printExample(example: Example) {
    if example.status() == .Pass {
      passedCount++
      printer.print("✓ \(example.subject)")
    } else if example.status() == .Fail {
      failedExamples.append(example)
      printer.print("× \(example.subject)")
    } else {
      pendingCount++
      printer.print("★ \(example.subject)")
    }
  }
  
  func printSpec(spec: Specification) {
    printer.lineBreak()
    printer.print("\(spec.subject) (\(spec.timer.toString())s)")
    printer.indent()
    
    for ex in spec.examples { printExample(ex) }
    for s in spec.children { printSpec(s) }
    
    printer.dedent()
  }
  
  func runCount() -> Int {
    return [passedCount, failedExamples.count, pendingCount].reduce(0, +)
  }
}

