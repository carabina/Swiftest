import Foundation

class ExpectationResult {
  var status = ExampleStatus.Pending
  
  func assert(cond : Bool) {
    self.status = cond ? ExampleStatus.Pass : ExampleStatus.Fail
  }
}

class Expectation<T:Comparable> {
  var actual : T[] = []
  var result = ExpectationResult()
  var reverse = false
  
  init(actual : T) {
    self.actual.append(actual)
  }
  
  func not() -> Expectation {
    self.reverse = !reverse
    return self
  }
  
  func toEqual(expected : T) {
    assert(actual[0] == expected)
  }
  
  func assert(cond:Bool) {
    result.assert(cond || reverse)
  }
}
