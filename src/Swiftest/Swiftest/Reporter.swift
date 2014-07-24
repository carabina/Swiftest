public class Reporter {
  public var listeners: [BaseListener] = []
  var failedExamples : [Example] = []
    
  public init() {}

  public func addListener(lsn: BaseListener) {
    listeners.append(lsn)
  }

  public func notify(fn: BaseListener -> Void) {
    for lsn in listeners { fn(lsn) }
  }

  public func suiteStarted() {
    notify({ lsn in lsn.suiteStarted() })
  }

  public func suiteFinished() {
    notify({ lsn in lsn.suiteFinished() })
  }

  public func specificationStarted(spec: Specification) {
    notify({ lsn in lsn.specificationStarted(spec) })
  }

  public func specificationFinished(spec: Specification) {
    notify({ lsn in lsn.specificationFinished(spec) })
  }

  public func exampleStarted(example: Example) {
    notify({ lsn in lsn.exampleStarted(example) })
  }

  public func exampleFinished(example: Example) {
    if(example.getStatus() == Status.Fail) {
      failedExamples.append(example)
    }

    notify({ lsn in lsn.exampleFinished(example) })
  }

  public func expectationPassed(expectation: BaseExpectation) {
    notify({ lsn in lsn.expectationPassed(expectation) })
  }

  public func expectationFailed(expectation: BaseExpectation) {
    notify({ lsn in lsn.expectationFailed(expectation) })
  }

}
