struct Swiftest {
  typealias VoidFn = Void -> Void
  typealias Runner = Context -> Void

  static let reporter = Reporter()
  static let nullExample = Example(subject : "null example", fn: nullFn)
  static let nullSpec = Specification(subject: "null spec")
  static let nullFn : VoidFn = {}
  
  static var context = Context()
  static var runner : Runner = { (let context) in
    for spec in context.specs { spec.run() }
  }

  static func describe(target:String, fn:VoidFn, file:String = __FILE__, line:Int = __LINE__) -> Specification {
    context.addSpec(Specification(subject: target, file: file, line: line))
    fn()
    return context.popSpec()
  }
  
  static func register(suites:SwiftestSuite[]) -> SwiftestSuite[] {
    for suite in suites { suite.spec }; return suites
  }
  
  static func run() {
    reporter.suiteStarted()
    runner(context)
    reporter.suiteFinished()
  }
}

