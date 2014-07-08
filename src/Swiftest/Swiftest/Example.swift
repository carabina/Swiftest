class Example : Runnable {
  var subject: String
  var fn: VoidBlk = Util.nullFn
  var expectations: [BaseExpectation] = []
  
  let cursor: Cursor
  let ofType = "Example"

  init(subject: String, fn: VoidBlk, cursor: Cursor = Util.nullCursor) {
    self.subject = subject
    self.fn = fn
    self.cursor = cursor
  }

  func run() {
    Swiftest.context.current().withExample(self) {
      Swiftest.reporter.exampleStarted(self)
      self.fn()
      Swiftest.reporter.exampleFinished(self)
    }
  }

  func getStatus() -> ExampleStatus {
    for status in [ExampleStatus.Fail, ExampleStatus.Pending] {
      if !(expectations.filter(Util.hasStatus(status))).isEmpty {
        return status
      }
    }

    return expectations.isEmpty ? .Pending : .Pass
  }
}
