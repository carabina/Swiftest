public class ConsoleListener : BaseListener {

  public var printer: String -> Void = println
  var passedCount = 0
  var failedCount = 0
  var pendingCount = 0
  var offset = 0
  
  public override init() { super.init() }

  public override func suiteFinished() {
    printer("")
    for ex in Swiftest.reporter.failedExamples {
      indentPrint("× \"\(ex.subject)\" failed:")
      offset += 1
      for exp in ex.expectations.filter(Status.has(.Fail)) {
        indentPrint("\(exp.msg) (\(exp.cursor.relativePath()):\(exp.cursor.line))")
      }

      printer("")

      offset -= 1
    }
    
    printer(
      ":: RESULTS :: completed in \(Swiftest.timer.toString())s\n" +
      "✓ \(passedCount)/\(runCount()) examples passed :: " +
      "× \(failedCount) failed :: " +
      "★ \(pendingCount) pending\n"
    )
  }

  public override func specificationFinished(spec: Specification) { printSpec(spec) }

  func printExample(example: Example) {
    if example.getStatus() == Status.Pass {
      passedCount++
      indentPrint("✓ \(example.subject)")
    } else if example.getStatus() == .Fail {
      failedCount++
      indentPrint("× \(example.subject)")
    } else {
      pendingCount++
      indentPrint("★ \(example.subject)")
    }
  }
  
  func printSpec(spec: Specification) {
    printer("")
    indentPrint("\(spec.subject) (\(spec.timer.toString())s)")
    offset += 1
    
    for ex in spec.context.examples() { printExample(ex) }
    for s in spec.context.specs() { printSpec(s) }
    
    offset -= 1
  }

  func indentPrint(msg: String) {
    var indentation = ""
    
    if(offset > 0) {
      for _ in 1...self.offset { indentation += "  " }
    }

    printer(indentation + msg)
  }

  func runCount() -> Int {
    return passedCount + failedCount + pendingCount
  }
}
