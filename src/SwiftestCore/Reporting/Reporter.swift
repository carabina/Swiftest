public struct Reporter {
  var listeners: [Listener] = [ConsoleListener()]
  
  mutating public func addListener(lsn: Listener) {
    listeners.append(lsn)
  }
  
  func started(spec: Specification) {
    eachListener({ $0.finished(spec) })
  }
  
  func finished(spec: Specification) {
    eachListener({ $0.finished(spec) })
  }
  
  func started(ex: Example) {
    eachListener({ $0.started(ex) })
  }
  
  func finished(ex: Example) {
    eachListener({ $0.finished(ex) })
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