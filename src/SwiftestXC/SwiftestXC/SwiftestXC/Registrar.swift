import SwiftestCore
import ObjectiveC

class XCListener : Listener {
  override init() { super.init() }
  
  override func exampleFinished(ex: Example) {
    let isFailing = Status.equals(.Fail)
    
    for failure in ex.expectations.filter({ isFailing($0) }) {
      XCTFail(
        failure.msg,
        file: failure.cursor.file,
        line: UInt(failure.cursor.line)
      )
    }
  }
}

@objc public class Registrar {
  struct Static {
    static var token : dispatch_once_t = 0
  }
  
  public class func register(type: SwiftestSpec.Type) {
    dispatch_once(&Static.token) {
      var lsn = XCListener()
      Swiftest.reporter.addListener(lsn)
    }
    
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