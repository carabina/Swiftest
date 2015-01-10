import SwiftestCore

struct Context {
  static var specs : Dictionary<String, Specification> = [:]
  static var specStack = [nullSpec]
  static var currentSuite : SwiftestSpec.Type?
  static var currentExample = nullExample
  
  static func described(spec: Specification) {
    if(specStack.count == 1) {
      if(specs[toString(currentSuite!)] == nil) {
        specs[toString(currentSuite!)] = spec
        evaluate(spec)
      }
    } else {
      currentSpec().add(spec)
      evaluate(spec)
    }
  }
  
  static func evaluate(spec: Specification) {
    specStack.append(spec)
    spec.fn()
    specStack.removeLast()
  }
  
  static func currentSpec() -> Specification {
    return specStack[specStack.count - 1]
  }
  
  static func toString(type: SwiftestSpec.Type) -> String {
    return String(UTF8String: class_getName(type))!
  }
  
  static func specFor(type: SwiftestSpec.Type) -> Specification? {
    return specs[toString(type)]
  }
  
  static func withExample(ex: Example, fn: VoidBlk) {
    currentExample = ex
    fn()
    currentExample = nullExample
  }
}