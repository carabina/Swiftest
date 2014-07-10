class Reporter {
  var listeners: [BaseListener] = []
  var failedExamples : [Example] = []

  func addListener(lsn: BaseListener) {
    listeners.append(lsn)
  }

  func notify(fn: BaseListener -> Void) {
    for lsn in listeners { fn(lsn) }
  }

  func suiteStarted() {
    notify({ lsn in lsn.suiteStarted() })
  }

  func suiteFinished() {
    notify({ lsn in lsn.suiteFinished() })
  }

  func specificationStarted(spec: Specification) {
    notify({ lsn in lsn.specificationStarted(spec) })
  }

  func specificationFinished(spec: Specification) {
    notify({ lsn in lsn.specificationFinished(spec) })
  }

  func exampleStarted(example: Example) {
    notify({ lsn in lsn.exampleStarted(example) })
  }

  func exampleFinished(example: Example) {
    if(example.getStatus() == .Fail) {
      failedExamples.append(example)
    }

    notify({ lsn in lsn.exampleFinished(example) })
  }

  func expectationPassed(expectation: BaseExpectation) {
    notify({ lsn in lsn.expectationPassed(expectation) })
  }

  func expectationFailed(expectation: BaseExpectation) {
    notify({ lsn in lsn.expectationFailed(expectation) })
  }

}
