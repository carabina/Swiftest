import SwiftestCore

struct Context {
  static var specs : Dictionary<String, Specification> = [:]
  static var specStack = [nullSpec]
  static var currentSuite : Registrar.SpecType?
  
  static func described(spec: Specification) {
    if(specStack.count == 1 && specs[toString(currentSuite!)] == nil) {
      specs[toString(currentSuite!)] = spec
    }
    
    currentSpec().add(spec)
        
    specStack.append(spec)
    spec.fn()
    specStack.removeLast()
  }
  
  static func currentSpec() -> Specification {
    return specStack[specStack.count - 1]
  }
  
  static func toString(type: Registrar.SpecType) -> String {
    return String(UTF8String: class_getName(type))!
  }
  
  static func specFor(type: Registrar.SpecType) -> Specification? {
    return specs[toString(type)]
  }
}