public class ConsoleListener : BaseListener {

  public var printer: String -> Void = println
  var passedCount = 0
  var failedCount = 0
  var pendingCount = 0
  var offset = 0
  
  var suiteStart : NSDate
    
  public override init() { suiteStart = NSDate(); super.init(); }

  public override func suiteFinished() {
    for ex in Swiftest.reporter.failedExamples {
      indentPrint("× \"\(ex.subject)\" failed:")
      offset += 1
      for exp in ex.expectations.filter(Status.has(.Fail)) {
        indentPrint("\(exp.msg) (\(exp.cursor.relativePath()):\(exp.cursor.line))")
      }

      printer("")

      offset -= 1
    }
    
    let elapsedTime = NSString(
      format: "%f", NSDate().timeIntervalSinceDate(suiteStart)
    )

    printer(
      ":: RESULTS :: completed in \(elapsedTime)s\n" +
      "✓ \(passedCount)/\(runCount()) examples passed :: " +
      "× \(failedCount) failed :: " +
      "★ \(pendingCount) pending\n"
    )
  }

  public override func specificationStarted(spec: Specification) {
    indentPrint(spec.subject)
    offset += 1
  }

  public override func specificationFinished(spec: Specification) {
    offset -= 1
    if offset == 0 { printer("") }
  }

  public override func exampleFinished(example: Example) {  
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
