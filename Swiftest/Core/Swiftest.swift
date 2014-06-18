struct Swiftest {
  typealias DescribeBlk = (Void -> Void)
  typealias Runner = (Context -> Void)

  static let reporter = Reporter()
  static let nullExample = Example(desc : "null example") {}
  static let nullSpec = Specification(subject: "null spec")
  static let nullBlock : DescribeBlk = {}
  
  static var context = Context()
  static var runner : Runner = { (let context) in
    for spec in context.specs { spec.run() }
  }

  static func describe(target : String, blk : DescribeBlk) -> Specification {
    context.addSpec(Specification(subject: target))

    blk()

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

