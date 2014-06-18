import Foundation

extension Swiftest {
  class ConsoleListener : BaseListener {
    
    var printer : String -> Void = println
    var runCount = 0
    var passedCount = 0
    var failedCount = 0
    var pendingCount = 0

    override func suiteStarted() { printer("\nSwiftest suite\n") }
    
    override func suiteFinished() {
      printer("\n:: RESULTS ::")
      printer("✓ \(passedCount)/\(runCount) examples passed :: × \(failedCount) failed :: ★ \(pendingCount) pending\n\n")
      assert(failedCount == 0, "exiting with failure status")
    }

    override func specificationStarted(spec: Specification) { printer(spec.subject) }
    override func specificationFinished(spec: Specification) { printer("") }
    
    override func exampleFinished(example: Swiftest.Example) {
      runCount++
      if example.getStatus() == ExampleStatus.Pass {
        passedCount++
        printer(" ✓ \(example.subject)")
      } else if example.getStatus() == ExampleStatus.Fail {
        failedCount++
        printer(" × \(example.subject)")
        for ex in example.expectations { printStatus(ex) }
      } else {
        pendingCount++
        printer(" ★ \(example.subject)")
      }
    }
    
    func printStatus(expectation : BaseExpectation) {
      if expectation.status == ExampleStatus.Fail {
        printer("   × \(expectation.msg)")
      } else if expectation.status == ExampleStatus.Pass {
        printer("   ✓ \(expectation.msg)")
      } else {
        printer("   ★ \(expectation.msg)")
      }
    }
  }
}