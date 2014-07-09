typealias Runner = Context -> Void
typealias VoidBlk = Void -> Void

struct Swiftest {
  static let reporter = Reporter()
  static let systemListener = SystemListener()

  static var context = Context()
  static var runner: Runner = { (let context) in
    for spec in context.specs { spec.run() }
  }

  static func describe(
    target: String,
    fn: VoidBlk,
    cursor: Cursor = Util.nullCursor
  ) -> Specification {
    context.addSpec(Specification(subject: target, cursor: cursor))
    fn()
    return context.popSpec()
  }

  static func run() {
    Registrar.registerAll()
    reporter.suiteStarted()
    context.specs.sort({ (let s1, s2) in s2.subject > s1.subject })
    runner(context)
    reporter.suiteFinished()
  }
}