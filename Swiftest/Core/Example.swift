extension Swiftest {
  class Example {
    
    var subject : String
    var blk : ExampleBlock = nullBlock
    var expectations : BaseExpectation[] = []
    
    init(desc: String, blk: ExampleBlock) {
      self.subject = desc
      self.blk  = blk
    }
    
    init(subject: String) { self.subject = subject }
    
    func expect<T:Comparable>(subject : T) -> ScalarExpectation<T> {
      return _addExpectation(ScalarExpectation(subject: subject))
    }
    
    func expect<T:Comparable>(subject : T[]) -> ArrayExpectation<T> {
      return _addExpectation(ArrayExpectation(subject : subject))
    }
    
    func expect<K:Comparable,V:Comparable>(
      subject : Dictionary<K,V>
    ) -> DictionaryExpectation<K, V> {
        return _addExpectation(DictionaryExpectation(subject : subject))
    }
    
    func expect(subject : Bool) -> BoolExpectation {
      return _addExpectation(BoolExpectation(subject: subject))
    }
    
    func run() {
      context.current().withExample(self) {
        reporter.exampleStarted(self)
        self.blk()
        reporter.exampleFinished(self)
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
}
