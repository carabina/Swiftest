let runHooks : (Specification.Context, HookType) -> Void = {
  (let context, hookType) in
  for blk in context.hooksFor(hookType) { blk() }
}

public class Specification : Runnable {
  public let subject : String
  public var timer = Timer()
  let ofType = RunnableType.Specification
  let cursor : Cursor
  var context = Specification.Context()
  var parent: Specification?

  init(subject:String, cursor: Cursor = nullCursor) {
    self.subject = subject
    self.cursor = cursor
  }

  func addExample(
    subject: String,
    fn: VoidBlk,
    cursor: Cursor = nullCursor
  ) {
    context.add(Example(subject: subject, fn: fn, cursor: cursor))
  }

  func before(hook: HookType, fn: VoidBlk) {
    context.addHook(hook, fn: fn)
  }

  func addSpec(spec: Specification) { spec.parent = self; context.add(spec) }

  public func run() {
    timer.start()
    Swiftest.reporter.specificationStarted(self)
    
    let exec : Runnable -> Void = { (let runnable) in
      runHooks(self.context, .each)
      runnable.run()
    }

    context.sort()
    runHooks(context, .all)

    for ex in context.examples() {
      for defn in context.definitions { defn.reset() }
      exec(ex)
    }

    for spec in context.specs() { exec(spec) }
    
    timer.stop()
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
