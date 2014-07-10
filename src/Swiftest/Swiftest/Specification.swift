class Specification : Runnable {
  let ofType = "Spec"
  var context = Specification.Context()

  let subject : String
  let cursor : Cursor
  var definitions : [Resettable] = []

  init(subject:String, cursor: Cursor = nullCursor) {
    self.subject = subject
    self.cursor = cursor
  }

  func example(
    subject: String,
    fn: VoidBlk,
    cursor: Cursor = nullCursor
  ) {
    context.add(Example(subject: subject, fn: fn, cursor: cursor))
  }

  func beforeEach(fn: VoidBlk) {
    context.beforeEach.append(fn)
  }

  func beforeAll(fn: VoidBlk) {
    context.beforeAll.append(fn)
  }

  func addSpec(spec: Specification) { context.add(spec) }

  func run() {
    Swiftest.reporter.specificationStarted(self)

    context.sort()
    for blk in context.beforeAll { blk() }

    for ex in context.examples() {
      for defn in definitions { defn.reset() }
      for blk in context.beforeEach { blk() }
      ex.run()
    }
    
    for spec in context.specs() { spec.run() }
    
    Swiftest.reporter.specificationFinished(self)
  }

  func getStatus() -> Status {
    return context.children.filter(Status.has(.Fail)).isEmpty ? .Pass: .Fail
  }

  func withExample(ex: Example, fn: VoidBlk) { context.withExample(ex, fn: fn) }

  func define<T>(fn: Void -> T) -> Void -> T {
    let defn = Definition(fn: fn)
    self.definitions.append(defn)
    return defn.block()
  }
}
