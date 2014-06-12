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
    return addExpectation(ScalarExpectation(actual: actual))
  }
  
  func expect<T:Comparable>(actual : T[]) -> CollectionExpectation<T> {
    return addExpectation(CollectionExpectation(actual : actual))
  }
  
  func expect<K:Comparable,V:Comparable>(
    actual : Dictionary<K,V>
  ) -> DictionaryExpectation<K, V> {
    return addExpectation(DictionaryExpectation(actual : actual))
  }

  func run() {
    if let exampleBlock = self.blk {
      exampleBlock(self)
    }
  }
  
  func getStatus() -> ExampleStatus {
    if hasStatus(ExampleStatus.Fail) {
      return ExampleStatus.Fail
    } else if hasStatus(ExampleStatus.Pending) {
      return ExampleStatus.Pending
    }
    
    return ExampleStatus.Pass
  }
  
  func hasStatus(status : ExampleStatus) -> Bool {
    return results.filter({ ex in ex.status == status }).count > 0
  }
  
  func addExpectation<T:BaseExpectation>(ex : T) -> T {
    results.append(ex.result)
    return ex
  }
  
}