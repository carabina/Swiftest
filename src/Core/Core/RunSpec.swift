func runHooks(ofType: HookType, forSpec: Specification) {
  for hook in forSpec.hooks.ofType(ofType) { hook() }
}

extension Swiftest {
  public static func runSpec(spec: Specification) {
    spec.timer.time() {
      Swiftest.reporter.specStarted(spec)
      
      runHooks(.All, spec)
      
      for ex in spec.examples {
        runHooks(.Each, spec)
        for defn in spec.definitions { defn.reset() }
        self.runExample(ex)
      }
      
      for child in spec.children {
        runHooks(.Each, spec)
        self.runSpec(child)
      }
    }

    Swiftest.reporter.specFinished(spec)
  }
  
}