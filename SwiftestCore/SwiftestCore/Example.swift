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

  func expect<T:NSObject>(actual : T) -> Expectation<T> {
    let expectation = Expectation(actual: actual)
    results.append(expectation.result)
    return expectation
  }
  
}