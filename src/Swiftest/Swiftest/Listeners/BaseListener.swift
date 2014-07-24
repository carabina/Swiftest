public class BaseListener {
  public var name = ""

  public init() {}
  public init(name: String) { self.name = name }

  public func suiteStarted() {}
  public func suiteFinished() {}

  public func specificationStarted(spec: Specification) {}
  public func specificationFinished(spec: Specification) {}

  public func exampleStarted(example: Example) {}
  public func exampleFinished(example: Example) {}

  public func expectationPassed(expectation: BaseExpectation) {}
  public func expectationFailed(expectation: BaseExpectation) {}
}
