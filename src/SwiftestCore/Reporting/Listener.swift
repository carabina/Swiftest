public class Listener {
  public func started(spec: Specification) {}
  public func finished(spec: Specification) {}
  
  public func started(ex: Example) {}
  public func finished(ex: Example) {}
  
  public func suiteStarted() {}
  public func suiteFinished() {}
  
  public init() {}
}
