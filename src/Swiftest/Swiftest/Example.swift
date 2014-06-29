let _has: ExampleStatus -> (BaseExpectation -> Bool) = { (let status) in
  return { exp in exp.getStatus() == status }
}

class Example : Runnable {
  var subject: String
  var fn: VoidBlk = Util.nullFn
  var expectations: BaseExpectation[] = []
  
  let cursor: Cursor
  let ofType = "Example"

  init(
    subject: String,
    fn: VoidBlk,
    cursor: Cursor = Util.nullCursor
  ) {
    self.subject = subject
    self.fn = fn
    self.cursor = cursor
  }

  func expect<T:Comparable>(
    subject: T, cursor: Cursor = Util.nullCursor
  ) -> ScalarExpectation<T> {
    return _addExpectation(
      ScalarExpectation(subject: subject, cursor: cursor)
    )
  }

  func expect<T:Comparable>(
    subject: T[],
    cursor: Cursor = Util.nullCursor
  ) -> ArrayExpectation<T> {
    return _addExpectation(
      ArrayExpectation(subject: subject, cursor: cursor)
    )
  }

  func expect<K:Comparable, V:Comparable>(
    subject: Dictionary<K, V>,
    cursor: Cursor = Util.nullCursor
  ) -> DictionaryExpectation<K, V> {
    return _addExpectation(
      DictionaryExpectation(subject: subject, cursor: cursor)
    )
  }

  func expect(
    subject: Bool,
    cursor: Cursor = Util.nullCursor
  ) -> BoolExpectation {
    return _addExpectation(
      BoolExpectation(subject: subject, cursor: cursor)
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
