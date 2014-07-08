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

  func addSpec(spec: Specification) { context.add(spec) }

  func run() {
    Swiftest.reporter.specificationStarted(self)
    sort(&context.children, Util.sortRunnables())

    for child in context.children {
      for defn in definitions { defn.reset() }
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
