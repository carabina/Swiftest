let _has: ExampleStatus -> (BaseExpectation -> Bool) = { (let status) in
  return { exp in exp.getStatus() == status }
}

class Example : Runnable {
  var subject: String
  var fn: VoidFn = Swiftest.nullFn
  var expectations: BaseExpectation[] = []
  
  let cursor: Cursor
  let ofType = "Example"

  init(
    subject: String,
    fn: VoidFn,
    file: String = __FILE__,
    line: Int = __LINE__
  ) {
    self.subject = subject
    self.fn = fn
    self.cursor = Cursor(file: file, line: line)
  }

  func expect<T:Comparable>(
    subject: T,
    file: String = __FILE__,
    line: Int = __LINE__
  ) -> ScalarExpectation<T> {
    return _addExpectation(
      ScalarExpectation(subject: subject, file: file, line: line)
    )
  }

  func expect<T:Comparable>(
    subject: T[],
    file: String = __FILE__,
    line: Int = __LINE__
  ) -> ArrayExpectation<T> {
    return _addExpectation(
      ArrayExpectation(subject: subject, file: file, line: line)
    )
  }

  func expect<K:Comparable, V:Comparable>(
    subject: Dictionary<K, V>,
    file: String = __FILE__,
    line: Int = __LINE__
  ) -> DictionaryExpectation<K, V> {
    return _addExpectation(
      DictionaryExpectation(subject: subject, file: file, line: line)
    )
  }

  func expect(
    subject: Bool,
    file: String = __FILE__,
    line: Int = __LINE__
  ) -> BoolExpectation {
    return _addExpectation(
      BoolExpectation(subject: subject, file: file, line: line)
    )
  }

  func run() {
    Swiftest.context.current().withExample(self) {
      Swiftest.reporter.exampleStarted(self)
      self.fn()
      Swiftest.reporter.exampleFinished(self)
    }
  }

  func getStatus() -> ExampleStatus {
    if !(expectations.filter(_has(.Fail)).isEmpty) {
      return .Fail
    } else if !(expectations.filter(_has(.Pending)).isEmpty) {
      return .Pending
    }

    return expectations.isEmpty ? .Pending : .Pass
  }

  func _addExpectation<T:BaseExpectation>(exp: T) -> T {
    exp.example = self
    expectations.append(exp)
    return exp
  }
}
