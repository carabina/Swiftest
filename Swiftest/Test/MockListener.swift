import Swiftest

struct SwiftestTests {
  class MockListener : Swiftest.BaseListener {
    
    var specificationStartedCalls : String[]  = []
    var specificationFinishedCalls : String[] = []
    var exampleStartedCalls : String[]        = []
    var exampleFinishedCalls : String[]       = []
    var suiteStartedCalls : String[]          = []
    var suiteFinishedCalls : String[]         = []
    var expectationPassedCalls : Swiftest.ExampleStatus[]  = []
    var expectationFailedCalls : Swiftest.ExampleStatus[] = []
    
    override func specificationStarted(spec: Swiftest.Specification) {
      self.specificationStartedCalls.append(spec.subject)
    }
    
    override func specificationFinished(spec: Swiftest.Specification) {
      self.specificationFinishedCalls.append(spec.subject)
    }
    
    override func exampleStarted(example: Swiftest.Example) {
      self.exampleStartedCalls.append(example.subject)
    }
    
    override func exampleFinished(example: Swiftest.Example) {
      self.exampleFinishedCalls.append(example.subject)
    }
    
    override func expectationPassed(expectation: Swiftest.BaseExpectation) {
      self.expectationPassedCalls.append(expectation.status)
    }
    
    override func expectationFailed(expectation: Swiftest.BaseExpectation) {
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