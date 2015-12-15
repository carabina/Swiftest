private func runHooks(ofType: Hooks.HookType, forSpec spec: Specification) {
  for hook in spec.hooks[ofType] { hook() }
}

extension Example {
  public class func run(example: Example, spec: Specification) throws -> Void throws -> Void {
    return {
      Swiftest.reporter.started(example)

      runHooks(.Before, forSpec: spec)

      try example.fn()

      Swiftest.reporter.finished(example)
    }
  }
}
