let _sorter : (Runnable, Runnable) -> Bool = { (let r1, r2) in
  return r1.ofType < r2.ofType
}

class Specification : Runnable {
  let ofType = "Spec"
  var context = Specification.Context()

  let subject : String
  let cursor : Cursor

  init(subject:String, cursor: Cursor = Util.nullCursor) {
    self.subject = subject
    self.cursor = cursor
  }

  func example(
    subject: String,
    fn: VoidBlk,
    cursor: Cursor = Util.nullCursor
  ) {
    context.add(Example(subject: subject, fn: fn, cursor: cursor))
  }

  func addSpec(spec: Specification) {
    context.add(spec)
  }

  func run() {
    Swiftest.reporter.specificationStarted(self)
    for child in sort(context.children, _sorter) { child.run() }
    Swiftest.reporter.specificationFinished(self)
  }

  func getStatus() -> ExampleStatus {
    return context.children.filter(Util.hasStatus(.Fail)).isEmpty ? .Pass: .Fail
  }

  func withExample(ex: Example, fn: VoidBlk) {
    context.onExample = ex
    fn()
    context.onExample = Util.nullExample
  }
}
