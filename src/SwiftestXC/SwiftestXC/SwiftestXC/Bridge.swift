import SwiftestCore
import ObjectiveC

@objc
public class Bridge {
  struct Static {
    static var token : dispatch_once_t = 0
  }
  
  @objc public class Result {
    public let name: String
    public let block: VoidBlock
    
    init(name: String, fn: VoidBlock) {
      self.name = name
      self.block = fn
    }
    
    class func build(spec: Specification)(ex: Example) -> Result {
      return Result(
        name: ex.subject,
        fn: { Context.withExample(ex, Example.run(ex, spec: spec)) }
      )
    }
  }
  
  public class func setup() {
    dispatch_once(&Static.token) {
      var lsn = XCListener()
      Swiftest.reporter.addListener(lsn)
    }
  }
  
  public class func register(type: SwiftestSpec.Type) {
    setup()
    Context.currentSuite = type
    type()
  }
  
  public class func forSpec(type: SwiftestSpec.Type) -> [Result] {
    if let spec = Context.specFor(type) {
      return Run.blocksFor(spec)
    }
    
    return []
  }
}