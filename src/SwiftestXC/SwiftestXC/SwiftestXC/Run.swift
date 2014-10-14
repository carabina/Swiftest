import SwiftestCore

func runHooks(ofType: HookType, forSpec: Specification) {
  for hook in forSpec.hooks.ofType(ofType) { hook() }
}

@objc public class Result {
  public let name: String
  public let block: VoidBlock
  
  init(name: String, block: VoidBlock) {
    self.name = name
    self.block = block
  }
}

struct Run {
  static func blocksFor(spec: Specification) -> [Result] {
    var immediateExamples : [Result] = spec.examples.map() { (let ex) in
      return Result(name: ex.subject, block: {
        runHooks(.Each, spec)
        for defn in spec.definitions { defn.reset() }
        ex.fn()
      })
    }
        
    for child : [Result] in spec.children.map({ self.blocksFor($0) }) {
      immediateExamples += child
    }
    
    return immediateExamples
  }
}