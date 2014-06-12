import Foundation

class Example {
  
  var description : String
  var blk : ExampleBlock?
  var status = ExampleStatus.Pending
  var results : ExpectationResult[] = []
  
  init(desc: String, blk: ExampleBlock?) {
    self.description = desc
    self.blk  = blk
  }

  func expect<T:Comparable>(actual : T) -> ScalarExpectation<T> {
    return _addExpectation(ScalarExpectation(actual: actual))
  }
  
  func expect<T:Comparable>(actual : T[]) -> CollectionExpectation<T> {
    return _addExpectation(CollectionExpectation(actual : actual))
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
    Swiftest.context.currentExample = self
    if let exampleBlock = blk {
      exampleBlock()
    }
    
    Swiftest.context.currentExample = Swiftest.nullExample
  }
  
  func getStatus() -> ExampleStatus {
    if _hasStatus(ExampleStatus.Fail) {
      return ExampleStatus.Fail
    } else if _hasStatus(ExampleStatus.Pending) {
      return ExampleStatus.Pending
    }
    
    return ExampleStatus.Pass
  }
  
  func _hasStatus(status : ExampleStatus) -> Bool {
    return results.filter({ ex in ex.status == status }).count > 0
  }
  
  func _addExpectation<T:BaseExpectation>(ex : T) -> T {
    results.append(ex.result)
    return ex
  }
  
}