import SwiftestCore
import ObjectiveC

func initSpecs() {
}

func runSpec(spec: Specification) {
  Swiftest.reporter.started(spec)

  for example in spec.examples {
    Context.withExample(example, fn: Example.run(example, spec: spec))
  }

  for child in spec.children { runSpec(child) }

  Swiftest.reporter.finished(spec)
}

func runSpecs() {
  initSpecs()
  let listener = ConsoleListener()

  Swiftest.reporter.addListener(listener)
  Swiftest.reporter.suiteStarted()

  for spec in Context.specs {
    runSpec(spec)
  }

  Swiftest.reporter.suiteFinished()
}

runSpecs()
