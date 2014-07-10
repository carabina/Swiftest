typealias Runner = Context -> Void
typealias VoidBlk = Void -> Void

let nullExample = Example(subject : "null example", fn: nullFn)
let nullSpec = Specification(subject: "null spec")
let nullFn: VoidBlk = {}
let nullCursor = Cursor(file: "null", line: 0)

struct Swiftest {
  static let reporter = Reporter()

  static var context = Context()
  static var runner: Runner = { (let context) in
    for spec in context.specs { spec.run() }
  }

  static func describe(
    subject: String,
    fn: VoidBlk,
    cursor: Cursor = nullCursor
  ) -> Specification {
    context.addSpec(Specification(subject: subject, cursor: cursor))
    fn()
    return context.popSpec()
  }

  static func run() -> Int {
    Registrar.registerAll()
    context.sort()
    
    reporter.suiteStarted()
    runner(context)
    reporter.suiteFinished()
    
    return reporter.failedExamples.count
  }
}