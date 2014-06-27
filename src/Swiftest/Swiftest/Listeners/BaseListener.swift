class BaseListener {
  var name = ""

  init() {}
  init(name:String) { self.name = name }

  func suiteStarted() {}
  func suiteFinished() {}

  func specificationStarted(spec: Specification) {}
  func specificationFinished(spec: Specification) {}

  func exampleStarted(example: Example) {}
  func exampleFinished(example: Example) {}

  func expectationPassed(expectation: BaseExpectation) {}
  func expectationFailed(expectation: BaseExpectation) {}
}
