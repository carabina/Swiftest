public class Specification : Runnable {
  let ofType = RunnableType.Specification
  var context = Specification.Context()

  public let subject : String
  let cursor : Cursor

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

  func before(hook: HookType, fn: VoidBlk) {
    context.addHook(hook, fn: fn)
  }

  func addSpec(spec: Specification) { context.add(spec) }

  public func run() {
    Swiftest.reporter.specificationStarted(self)

    let runHooks : HookType -> Void = { (let hookType) in
      for blk in self.context.hooksFor(hookType) { blk() }
    }

    context.sort()
    runHooks(.all)

    for ex in context.examples() {
      for defn in context.definitions { defn.reset() }
      runHooks(.each)
      ex.run()
    }

    for spec in context.specs() {
      runHooks(.each)
      spec.run()
    }

    Swiftest.reporter.specificationFinished(self)
  }

  public func getStatus() -> Status {
    return context.children.filter(Status.has(.Fail)).isEmpty ? .Pass: .Fail
  }

  func withExample(ex: Example, fn: VoidBlk) { context.withExample(ex, fn: fn) }

  func define<T>(fn: Void -> T) -> Void -> T {
    let defn = Definition(fn: fn)
    context.definitions.append(defn)
    return defn.block()
  }
}
