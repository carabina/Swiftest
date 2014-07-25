public typealias Runner = Context -> Void
public typealias VoidBlk = Void -> Void

let nullExample = Example(subject : "null example", fn: nullFn)
let nullSpec = Specification(subject: "null spec")
let nullFn: VoidBlk = {}
let nullCursor = Cursor(file: "null", line: 0)

public struct Swiftest {
  public static let reporter = Reporter()

  static var context = Context()
  public static var runner: Runner = { (let context) in
    for spec in context.specs { spec.run() }
  }

  public static func describe(
    subject: String,
    fn: VoidBlk,
    cursor: Cursor = nullCursor
  ) -> Specification {
    context.addSpec(Specification(subject: subject, cursor: cursor))
    fn()
    return context.popSpec()
  }

  public static func run() -> Int {
    Registrar.registerAll()
    context.sort()

    reporter.suiteStarted()
    runner(context)
    reporter.suiteFinished()

    return reporter.failedExamples.count == 0 ? 0 : 1
  }
}
