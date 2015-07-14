@exported import SwiftestCore

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

  Context.rootSpecs.forEach(runSpec)

  finished()
  Swiftest.reporter.suiteFinished()
}

func finished() {
}
