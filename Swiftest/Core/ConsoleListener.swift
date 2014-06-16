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
      print("✓ \(passedCount)/\(runCount) examples passed :: × \(failedCount) failed :: ★ \(pendingCount) pending\n\n")
      assert(failedCount == 0, "exiting with failure status")
    }

    override func specificationStarted(spec: Swiftest.Specification) { printer(spec.name) }
    override func specificationFinished(spec: Swiftest.Specification) { printer("") }
    
    override func exampleFinished(example: Swiftest.Example) {
      runCount++
      if example.getStatus() == ExampleStatus.Pass {
        passedCount++
        printer(" ✓ \(example.description)")
      } else if example.getStatus() == ExampleStatus.Fail {
        failedCount++
        printer(" × \(example.description)")

        for expectation in example.expectations {
          if expectation.status == ExampleStatus.Fail {
            printer("   × \(expectation.msg)")
          } else if expectation.status == ExampleStatus.Pass {
            printer("   ✓ \(expectation.msg)")
          } else {
            printer("   ★ \(expectation.msg)")
          }
        }
      } else {
        pendingCount++
        printer(" ★ \(example.description)")
      }
    }
  }
}