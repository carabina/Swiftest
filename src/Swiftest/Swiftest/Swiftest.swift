typealias Runner = Context -> Void

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
    file: String = __FILE__,
    line: Int = __LINE__
  ) -> Specification {
    context.addSpec(Specification(subject: target, file: file, line: line))
    fn()
    return context.popSpec()
  }

  static func run() {
    Registrar.registerAll()
    reporter.suiteStarted()
    runner(context)
    reporter.suiteFinished()
  }
}