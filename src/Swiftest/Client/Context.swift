import SwiftestCore

struct Context {
  static var specs : [Specification] = []
  static var specStack = [nullSpec]
  static var currentExample = nullExample

  static func described(spec: Specification) {
    if specStack.count == 1 { specs.append(spec) }

    currentSpec.add(spec)
    evaluate(spec)
  }

  static func evaluate(spec: Specification) {
    specStack.append(spec)
    spec.fn()
    specStack.removeLast()
  }

  static var currentSpec: Specification {
    get { return specStack[specStack.count - 1] }
  }

  static func withExample(ex: Example, fn: VoidBlk) {
    currentExample = ex
    fn()
    currentExample = nullExample
  }
}
