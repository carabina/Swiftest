import Foundation

class Specification : Runnable {
  let ofType = "Spec"
  var context = Specification.Context()

  let subject : String
  let cursor : Cursor
  var definitions : [Resettable] = []

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

  func beforeEach(fn: VoidBlk) {
    context.beforeEach.append(fn)
  }

  func beforeAll(fn: VoidBlk) {
    context.beforeAll.append(fn)
  }

  func addSpec(spec: Specification) { context.add(spec) }

  func run() {
    context.children.sort(Util.sortRunnables())
    Swiftest.reporter.specificationStarted(self)

    for blk in context.beforeAll { blk() }

    for child in context.children {
      if child.ofType == "Example" {
        for defn in definitions { defn.reset() }
        for blk in context.beforeEach { blk() }
      }

      child.run()
    }
    
    Swiftest.reporter.specificationFinished(self)
  }

  func getStatus() -> ExampleStatus {
    return context.children.filter(Util.hasStatus(.Fail)).isEmpty ? .Pass: .Fail
  }

  func withExample(ex: Example, fn: VoidBlk) { context.withExample(ex, fn: fn) }

  func define<T>(fn: Void -> T) -> Void -> T {
    let defn = Definition(fn: fn)
    self.definitions.append(defn)
    return defn.block()
  }
}
