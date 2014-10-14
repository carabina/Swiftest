import SwiftestCore
import ObjectiveC

@objc public class Registrar {
  public typealias SpecType = SwiftestSpec.Type
  
  public class func register(type: SpecType) {    
    Context.currentSuite = type
    type()
  }
  
  public class func forSpec(type: SpecType) -> [Result] {
    if let spec = Context.specFor(type) {
      return Run.blocksFor(spec)
    }
    
    return []
  }

}
