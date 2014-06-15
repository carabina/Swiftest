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
      self.specificationStartedCalls.append(spec.name)
    }
    
    override func specificationFinished(spec: Swiftest.Specification) {
      self.specificationFinishedCalls.append(spec.name)
    }
    
    override func exampleStarted(example: Swiftest.Example) {
      self.exampleStartedCalls.append(example.description)
    }
    
    override func exampleFinished(example: Swiftest.Example) {
      self.exampleFinishedCalls.append(example.description)
    }
    
    override func expectationPassed(expectation: Swiftest.BaseExpectation, example: Swiftest.Example) {
      self.expectationPassedCalls.append(expectation.result.status)
    }
    
    override func expectationFailed(expectation: Swiftest.BaseExpectation, example: Swiftest.Example) {
      self.expectationFailedCalls.append(expectation.result.status)
    }
    
    override func suiteStarted() {
      self.suiteStartedCalls.append("started")
    }
    
    override func suiteFinished()  {
      self.suiteFinishedCalls.append("finished")
    }
  }
}