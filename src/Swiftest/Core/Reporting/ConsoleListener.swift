public class ConsoleListener : Listener {

  public class Printer {
    public var out: String -> Void = { print($0) }
    public var indentLevel = 0

    func call(output: String) {
      var indentation = ""

      if(indentLevel > 0) {
        for _ in 1...indentLevel { indentation += "  " }
      }

      out(indentation + output)
    }

    func lineBreak() { out("") }
    func indent() { indentLevel += 1 }
    func dedent() { indentLevel -= 1 }
  }

  public var printer = Printer()
  var passedCount = 0
  var failedExamples : [Example] = []
  var pendingCount = 0
  var offset = 0

  public override init() { super.init() }

  public override func suiteFinished() {
    printer.lineBreak()

    for ex in failedExamples {
      printer.call("× \"\(ex.subject)\" failed:")
      printer.indent()

      for exp in ex.expectations.filter({ Status.equals(.Fail)($0) }) {
        printer.call("\(exp.msg) (\(exp.cursor.file):\(exp.cursor.line))")
      }

      printer.lineBreak()

      printer.dedent()
    }

    printer.call(
      ":: RESULTS :: " +
        "✓ \(passedCount)/\(runCount()) examples passed :: " +
        "× \(failedExamples.count) failed :: " +
        "★ \(pendingCount) pending\n"
    )
  }

  public override func finished(spec: Specification) {
    if spec.parents.count == 1 { printSpec(spec) }
  }

  func printExample(example: Example) {
    if example.status == .Pass {
      passedCount++
      printer.call("✓ \(example.subject)")
    } else if example.status == .Fail {
      failedExamples.append(example)
      printer.call("× \(example.subject)")
    } else {
      pendingCount++
      printer.call("★ \(example.subject)")
    }
  }

  func printSpec(spec: Specification) {
    printer.lineBreak()
    printer.call(spec.subject)
    printer.indent()

    for ex in spec.examples { printExample(ex) }
    for s in spec.children { printSpec(s) }

    printer.dedent()
  }

  func runCount() -> Int {
    return [passedCount, failedExamples.count, pendingCount].reduce(0, combine: +)
  }
}

