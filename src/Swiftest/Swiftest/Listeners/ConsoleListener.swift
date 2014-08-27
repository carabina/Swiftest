public class ConsoleListener : BaseListener {

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
  var failedCount = 0
  var pendingCount = 0
  var offset = 0
  
  public override init() { super.init() }

  public override func suiteFinished() {
    printer.lineBreak()
    
    for ex in Swiftest.reporter.failedExamples {
      printer.print("× \"\(ex.subject)\" failed:")
      printer.indent()
      
      for exp in ex.expectations.filter(Status.has(.Fail)) {
        printer.print("\(exp.msg) (\(exp.cursor.relativePath()):\(exp.cursor.line))")
      }

      printer.lineBreak()

      printer.dedent()
    }
    
    printer.print(
      ":: RESULTS :: completed in \(Swiftest.timer.toString())s\n" +
      "✓ \(passedCount)/\(runCount()) examples passed :: " +
      "× \(failedCount) failed :: " +
      "★ \(pendingCount) pending\n"
    )
  }

  public override func specificationFinished(spec: Specification) {
    if spec.parents.isEmpty { printSpec(spec) }
  }

  func printExample(example: Example) {
    if example.getStatus() == Status.Pass {
      passedCount++
      printer.print("✓ \(example.subject)")
    } else if example.getStatus() == .Fail {
      failedCount++
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
    
    for ex in spec.context.examples() { printExample(ex) }
    for s in spec.context.specs() { printSpec(s) }
    
    printer.dedent()
  }

  func runCount() -> Int {
    return [passedCount, failedCount, pendingCount].reduce(0, +)
  }
}
