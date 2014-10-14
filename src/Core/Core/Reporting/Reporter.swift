public struct Reporter {
  var listeners: [Listener] = [ConsoleListener()]
  
  mutating public func addListener(lsn: Listener) {
    listeners.append(lsn)
  }
  
  func specStarted(spec: Specification) {
    eachListener({ $0.specStarted(spec) })
  }
  
  func specFinished(spec: Specification) {
    eachListener({ $0.specFinished(spec) })
  }
  
  func exampleStarted(ex: Example) {
    eachListener({ $0.exampleStarted(ex) })
  }
  
  func exampleFinished(ex: Example) {
    eachListener({ $0.exampleFinished(ex) })
  }
  
  func suiteStarted() {
    eachListener({ $0.suiteStarted() })
  }
  
  func suiteFinished() {
    eachListener({ $0.suiteFinished() })
  }
  
  func eachListener(fn: (Listener -> Void)) {
    for lsn in listeners { fn(lsn) }
  }
}