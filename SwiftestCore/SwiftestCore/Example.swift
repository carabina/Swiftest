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

  func expect<T:Comparable>(actual : T) -> Expectation<T> {
    let expectation = Expectation(actual: actual)
    results.append(expectation.result)
    return expectation
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
  
}