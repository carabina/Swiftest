import Foundation

class ConsoleListener : BaseListener {

  var printer : String -> Void = println
  var passedCount = 0
  var failedCount = 0
  var pendingCount = 0
  var offset = 0

  override func suiteStarted() { printer("\nSwiftest suite\n") }

  override func suiteFinished() {
    printer("\n:: RESULTS ::")
    printer("✓ \(passedCount)/\(runCount()) examples passed :: × \(failedCount) failed :: ★ \(pendingCount) pending\n\n")
    printer("")
  }

  override func specificationStarted(spec: Specification) {
    indent(spec.subject)
    offset += 1
  }

  override func specificationFinished(spec: Specification) {
    offset -= 1
    if offset > 0 {
      printer("")
    }
  }

  override func exampleFinished(example: Example) {
    if example.getStatus() == ExampleStatus.Pass {
      passedCount++
      indent("✓ \(example.subject)")
    } else if example.getStatus() == ExampleStatus.Fail {
      failedCount++
      indent("× \(example.subject)")
      offset += 1
      for ex in example.expectations { printStatus(ex) }
      offset -= 1
    } else {
      pendingCount++
      indent("★ \(example.subject)")
    }
  }

  func printStatus(expectation: BaseExpectation) {
    if expectation.status == ExampleStatus.Fail {
      indent("× \(expectation.msg)")
      indent("  at \(expectation.cursor.file):\(expectation.cursor.line)")
    } else if expectation.status == ExampleStatus.Pass {
      indent("✓ \(expectation.msg)")
    } else {
      indent("★ \(expectation.msg)")
    }
    printer("")
  }

  func indent(msg: String) {
    var str = ""
    for _ in 0..self.offset { str += "  " }

    printer(str + msg)
  }

  func runCount() -> Int {
    return passedCount + failedCount + pendingCount
  }
}
