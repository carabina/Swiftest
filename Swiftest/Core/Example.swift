extension Swiftest {
  class Example {
    
    var description : String
    var blk : ExampleBlock = Swiftest.nullBlock
    var expectations : BaseExpectation[] = []
    
    init(desc: String, blk: ExampleBlock) {
      self.description = desc
      self.blk  = blk
    }
    
    init(desc: String) { self.description = desc }
    
    func expect<T:Comparable>(actual : T) -> ScalarExpectation<T> {
      return _addExpectation(ScalarExpectation(actual: actual))
    }
    
    func expect<T:Comparable>(actual : T[]) -> ArrayExpectation<T> {
      return _addExpectation(ArrayExpectation(actual : actual))
    }
    
    func expect<K:Comparable,V:Comparable>(
      actual : Dictionary<K,V>
    ) -> DictionaryExpectation<K, V> {
        return _addExpectation(DictionaryExpectation(actual : actual))
    }
    
    func expect(actual : Bool) -> BoolExpectation {
      return _addExpectation(BoolExpectation(actual: actual))
    }
    
    func run() {
      Swiftest.currentSpec().currentExample = self
      
      Swiftest.reporter.exampleStarted(self)
      blk()
      Swiftest.reporter.exampleFinished(self)
      
      Swiftest.currentSpec().currentExample = Swiftest.nullExample
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
