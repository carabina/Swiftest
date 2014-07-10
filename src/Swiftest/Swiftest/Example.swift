class Example : Runnable {
  
  var expectations: [BaseExpectation] = []
  
  let subject: String
  let fn: VoidBlk = nullFn
  let cursor: Cursor
  let ofType = "Example"

  init(subject: String, fn: VoidBlk, cursor: Cursor = nullCursor) {
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

  func getStatus() -> Status {
    for status in [Status.Fail, Status.Pending] {
      if !(expectations.filter(Status.has(status))).isEmpty {
        return status
      }
    }

    return expectations.isEmpty ? .Pending : .Pass
  }
  
  func addExpectation<T:BaseExpectation>(exp: T) -> T {
    exp.example = self
    expectations.append(exp)
    return exp
  }
}
