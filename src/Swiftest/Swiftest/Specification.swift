let sorter : (Runnable, Runnable) -> Bool = { (let r1, r2) in
  return r1.ofType < r2.ofType
}

class Specification : Runnable {
  class Context {
    var children: Runnable[] = []
    var onExample : Example = Swiftest.nullExample

    func add(child: Runnable) {
      children.append(child)
    }
  }

  let ofType = "Spec"
  var context = Specification.Context()

  let subject : String
  let cursor : Cursor

  init(subject:String, file: String = __FILE__, line: Int = __LINE__) {
    self.subject = subject
    self.cursor = Cursor(file: file, line: line)
  }

  func example(
    subject: String,
    fn: VoidFn,
    file: String = __FILE__,
    line: Int = __LINE__
  ) {
    context.add(Example(subject: subject, fn: fn, file: file, line: line))
  }

  func addSpec(spec: Specification) {
    context.add(spec)
  }

  func run() {
    Swiftest.reporter.specificationStarted(self)
    for child in sort(context.children, sorter) { child.run() }
    Swiftest.reporter.specificationFinished(self)
  }

  func getStatus() -> ExampleStatus {
    return context.children.filter() { (let child) in
      child.getStatus() == .Fail
    }.isEmpty ? .Pass : .Fail
  }

  func withExample(ex: Example, fn: Void -> Void) {
    context.onExample = ex
    fn()
    context.onExample = Swiftest.nullExample
  }
}
