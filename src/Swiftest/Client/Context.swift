struct Context {
  static var rootSpecs : [Specification] = []
  static var specStack = [nullSpec]
  static var currentExample = nullExample
  static var beforeHooks: [VoidBlk] = [
    { Swiftest.reporter.addListener(ConsoleListener()) }
  ]

  static func described(spec: Specification) {
    if specStack == [nullSpec] {
      rootSpecs.append(spec)
    }

    currentSpec.add(spec)
    walkSpecTree(spec)
  }

  static func walkSpecTree(spec: Specification) {
    specStack.append(spec)
    spec.fn()
    specStack.removeLast()
  }

  static var currentSpec: Specification {
    get { return specStack[specStack.count - 1] }
  }

  static func withExample(ex: Example, fn: ExampleFn) throws {
    currentExample = ex
    try fn()
    currentExample = nullExample
  }
}

public class Spec {
  required public init() {}
}

public func register(specTypes: [Spec.Type]) {
  for specType in specTypes { 
    let _ = specType.init() 
  }
}
