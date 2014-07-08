class ConsoleListener : BaseListener {

  var printer: String -> Void = println
  var passedCount = 0
  var failedCount = 0
  var pendingCount = 0
  var offset = 0

  override func suiteFinished() {
    printer(
      "\n:: RESULTS :: \n" +
      "✓ \(passedCount)/\(runCount()) examples passed :: " +
      "× \(failedCount) failed :: " +
      "★ \(pendingCount) pending\n"
    )
  }

  override func specificationStarted(spec: Specification) {
    indentPrint(spec.subject)
    offset += 1
  }

  override func specificationFinished(spec: Specification) {
    offset -= 1
    if offset > 0 { printer("") }
  }

  override func exampleFinished(example: Example) {
    if example.getStatus() == .Pass {
      passedCount++
      indentPrint("✓ \(example.subject)")
    } else if example.getStatus() == .Fail {
      failedCount++
      indentPrint("× \(example.subject)")
      offset += 1
      for ex in example.expectations { printStatus(ex) }
      offset -= 1
    } else {
      pendingCount++
      indentPrint("★ \(example.subject)")
    }
  }

  func printStatus(expectation: BaseExpectation) {
    if expectation.getStatus() == .Fail {
      indentPrint("× \(expectation.msg)")
      indentPrint("  at \(expectation.cursor.file):\(expectation.cursor.line)")
    } else if expectation.getStatus() == .Pass {
      indentPrint("✓ \(expectation.msg)")
    } else {
      indentPrint("★ \(expectation.msg)")
    }
    printer("")
  }

  func indentPrint(msg: String) {
    var str = ""
    for _ in 1...self.offset { str += "  " }

    printer(str + msg)
  }

  func runCount() -> Int {
    return passedCount + failedCount + pendingCount
  }
}
