extension Swiftest {
  class BaseListener {
    func suiteStarted(context:Swiftest.Context) {}
    func suiteFinished(context:Swiftest.Context) {}
    func specificationStarted(context:Swiftest.Context) {}
    func specificationFinished(context:Swiftest.Context) {}
    func exampleStarted(context:Swiftest.Context) {}
    func exampleFinished(context:Swiftest.Context) {}
    func expectationPassed(context:Swiftest.Context) {}
    func expectationFailed(context:Swiftest.Context) {}
  }
}