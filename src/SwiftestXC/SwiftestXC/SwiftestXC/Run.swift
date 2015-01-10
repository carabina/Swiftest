import SwiftestCore
import Foundation

func runHooks(forSpec: Specification) {
  for hook in forSpec.hooks[.Before] { hook() }
}

@objc
public class Result {
  public let name: String
  public let block: VoidBlock
  
  init(name: String, block: VoidBlock) {
    self.name = name
    self.block = block
  }
}

struct Run {
  static func blocksFor(spec: Specification) -> [Result] {
    
    var examples: [Result] = spec.examples.map() { (let ex) in
      return Result(name: ex.subject, block: {
        Context.withExample(ex) {
          runHooks(spec)
          for defn in spec.definitions { defn.reset() }
          ex.call()
        }
      })
    }
        
    for res: [Result] in spec.children.map({ self.blocksFor($0) }) {
      examples += res
    }
    
    return examples
  }
}