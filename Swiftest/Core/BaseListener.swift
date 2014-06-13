extension Swiftest {
  class BaseListener {
    var name = ""
    
    init() {}
    init(name:String) { self.name = name }
    
    func suiteStarted() {}
    func suiteFinished() {}
    
    func specificationStarted(spec: Swiftest.Specification) {}
    func specificationFinished(spec: Swiftest.Specification) {}
    
    func exampleStarted(example:Swiftest.Example) {}
    func exampleFinished(example:Swiftest.Example) {}
    
    func expectationPassed(expectation: Swiftest.BaseExpectation, example: Swiftest.Example) {}
    func expectationFailed(context:Swiftest.Context) {}
  }
}