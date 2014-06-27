class Example : Runnable {

  var subject : String
  var ofType = "Example"
  var fn : VoidFn = Swiftest.nullFn
  var expectations : BaseExpectation[] = []
  let cursor : Cursor

  init(subject:String, fn:VoidFn, file:String = __FILE__, line:Int = __LINE__) {
    self.cursor = Cursor(file: file, line: line)
    self.subject = subject
    self.fn = fn
  }

  func expect<T:Comparable>(subject : T, file:String = __FILE__, line:Int = __LINE__) -> ScalarExpectation<T> {
    return _addExpectation(ScalarExpectation(subject: subject, file: file, line: line))
  }

  func expect<T:Comparable>(subject : T[], file:String = __FILE__, line:Int = __LINE__) -> ArrayExpectation<T> {
    return _addExpectation(ArrayExpectation(subject : subject, file: file, line: line))
  }

  func expect<K:Comparable,V:Comparable>(
    subject : Dictionary<K,V>,
    file:String = __FILE__,
    line:Int = __LINE__
  ) -> DictionaryExpectation<K, V> {
    return _addExpectation(DictionaryExpectation(subject : subject, file: file, line: line))
  }

  func expect(subject : Bool, file:String = __FILE__, line:Int = __LINE__) -> BoolExpectation {
    return _addExpectation(BoolExpectation(subject: subject, file: file, line: line))
  }

  func run() {
    Swiftest.context.current().withExample(self) {
      Swiftest.reporter.exampleStarted(self)
      self.fn()
      Swiftest.reporter.exampleFinished(self)
    }
  }

  func getStatus() -> ExampleStatus {
    if _hasStatus(ExampleStatus.Fail) {
      return ExampleStatus.Fail
    } else if _hasStatus(ExampleStatus.Pending) {
      return ExampleStatus.Pending
    }

    return expectations.count > 0 ? ExampleStatus.Pass : ExampleStatus.Pending
  }

  func _hasStatus(status : ExampleStatus) -> Bool {
    return expectations.filter({ ex in ex.status == status }).count > 0
  }

  func _addExpectation<T:BaseExpectation>(ex : T) -> T {
    ex.example = self
    expectations.append(ex)
    return ex
  }
}
