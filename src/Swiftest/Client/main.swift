import SwiftestCore

describe("true") {
  it("is supa true") {
    expect(true).to.equal(true)
  }
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
  let listener = ConsoleListener()
  Swiftest.reporter.addListener(listener)
  Swiftest.reporter.suiteStarted()

  for spec in Context.specs {
    runSpec(spec)
  }

  Swiftest.reporter.suiteFinished()
}

runSpecs()
