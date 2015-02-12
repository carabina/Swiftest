private func runHooks(ofType: Hooks.HookType, forSpec spec: Specification) {
  for hook in spec.hooks[ofType] { hook() }
}

extension Example {
  public class func run(example: Example, spec: Specification) -> VoidBlk {
    return {
      Swiftest.reporter.started(example)

      runHooks(.Before, forSpec: spec)
      for defn in spec.definitions { defn.reset() }
      
      example.fn()
      
      Swiftest.reporter.finished(example)
    }
  }
}