import Swiftest

struct SwiftestTests {
  class MockListener : BaseListener {

    var specificationStartedCalls : [String]  = []
    var specificationFinishedCalls : [String] = []
    var exampleStartedCalls : [String]        = []
    var exampleFinishedCalls : [String]       = []
    var suiteStartedCalls : [String]          = []
    var suiteFinishedCalls : [String]         = []
    var expectationPassedCalls : [Status]  = []
    var expectationFailedCalls : [Status] = []

    override func specificationStarted(spec: Specification) {
      self.specificationStartedCalls.append(spec.subject)
    }

    override func specificationFinished(spec: Specification) {
      self.specificationFinishedCalls.append(spec.subject)
    }

    override func exampleStarted(example: Example) {
      self.exampleStartedCalls.append(example.subject)
    }

    override func exampleFinished(example: Example) {
      self.exampleFinishedCalls.append(example.subject)
    }

    override func expectationPassed(expectation: BaseExpectation) {
      self.expectationPassedCalls.append(expectation.status)
    }

    override func expectationFailed(expectation: BaseExpectation) {
      self.expectationFailedCalls.append(expectation.status)
    }

    override func suiteStarted() {
      self.suiteStartedCalls.append("started")
    }

    override func suiteFinished()  {
      self.suiteFinishedCalls.append("finished")
    }
  }
}
