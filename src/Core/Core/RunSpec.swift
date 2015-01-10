func runHooks(type: Hooks.HookType, forSpec: Specification) {
  for hook in forSpec.hooks[type] { hook() }
}

extension Swiftest {
  public static func runSpec(spec: Specification) {
    spec.timer.time() {
      Swiftest.reporter.specStarted(spec)
      
      for ex in spec.examples {
        runHooks(.Before, spec)
        for defn in spec.definitions { defn.reset() }
        self.runExample(ex)
      }
      
      for child in spec.children {
        runHooks(.Before, spec)
        self.runSpec(child)
      }
    }

    Swiftest.reporter.specFinished(spec)
  }
  
}