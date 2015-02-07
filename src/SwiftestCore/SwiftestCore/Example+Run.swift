extension Array {
  func each(block: T -> Void) { for e in self { block(e) }}
}

private func runHooks(ofType: Hooks.HookType, forSpec spec: Specification) {
  spec.hooks[ofType].each({ $0() })
}

extension Example {
  public class func run(example: Example, spec: Specification) -> VoidBlk {
    return {
      Swiftest.reporter.started(example)

      runHooks(.Before, forSpec: spec)
      spec.definitions.each({ $0.reset() })
      
      example.fn()
      
      Swiftest.reporter.finished(example)
    }
  }
}