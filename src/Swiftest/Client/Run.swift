import OS

func runSpec(spec: Specification) throws {
  Swiftest.reporter.started(spec)

  for example in spec.examples {
    try Context.withExample(example, fn: Example.run(example, spec: spec))
  }

  for child in spec.children { try runSpec(child) }

  Swiftest.reporter.finished(spec)
}

public func run() throws {
  for hook in Context.beforeHooks { hook() }
  Swiftest.reporter.suiteStarted()

  let failures = Context.rootSpecs.filter { spec in
    try runSpec(spec)
    return spec.status == .Fail
  }

  Swiftest.reporter.suiteFinished()

  exit(failures.count == 0 ? 0 : 1)
}
