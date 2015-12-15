public struct Reporter {
  public var listeners: [Listener] = []

  mutating public func addListener(lsn: Listener) {
    listeners.append(lsn)
  }

  public func started(spec: Specification) {
    eachListener({ $0.started(spec) })
  }

  public func finished(spec: Specification) {
    eachListener({ $0.finished(spec) })
  }

  public func started(ex: Example) {
    eachListener({ $0.started(ex) })
  }

  public func finished(ex: Example) {
    eachListener({ $0.finished(ex) })
  }

  public func suiteStarted() {
    eachListener({ $0.suiteStarted() })
  }

  public func suiteFinished() {
    eachListener({ $0.suiteFinished() })
  }

  func eachListener(fn: (Listener -> Void)) {
    for lsn in listeners { fn(lsn) }
  }
}
