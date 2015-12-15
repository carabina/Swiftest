import OS

func runSpec(spec: Specification) {
  Swiftest.reporter.started(spec)

  for example in spec.examples {
    Context.withExample(example, fn: Example.run(example, spec: spec))
  }

  for child in spec.children { runSpec(child) }

  Swiftest.reporter.finished(spec)
}

public func run() {
  for hook in Context.beforeHooks { hook() }
  Swiftest.reporter.suiteStarted()

  let failures = Context.rootSpecs.filter { spec in
    runSpec(spec)
    return spec.status == .Fail
  }

  Swiftest.reporter.suiteFinished()

  exit(failures.count == 0 ? 0 : 1)
}
