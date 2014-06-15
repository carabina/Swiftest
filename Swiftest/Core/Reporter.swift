extension Swiftest {
  class Reporter {
    var listeners : BaseListener[] = []
    
    func addListener(listener : BaseListener) {
      listeners.append(listener)
    }
    
    func suiteStarted() {
      _notify({ listener in listener.suiteStarted() })
    }
    
    func suiteFinished() {
      _notify({ listener in listener.suiteFinished() })
    }
    
    func specificationStarted(spec : Specification) {
      _notify({ listener in listener.specificationStarted(spec) })
    }
    
    func specificationFinished(spec : Specification) {
      _notify({ listener in listener.specificationFinished(spec) })
    }
    
    func exampleStarted(example : Example) {
      _notify({ listener in listener.exampleStarted(example) })
    }
    
    func exampleFinished(example : Example) {
      _notify({ listener in listener.exampleFinished(example) })
    }
    
    func expectationPassed(expectation : BaseExpectation, example : Example) {
      _notify({
        listener in listener.expectationPassed(expectation)
      })
    }
    
    func expectationFailed(expectation : BaseExpectation, example : Example) {
      _notify({
        listener in listener.expectationFailed(expectation)
      })
    }
    
    func _notify(fn : BaseListener -> Void) {
      for listener in listeners { fn(listener) }
    }
  }
}