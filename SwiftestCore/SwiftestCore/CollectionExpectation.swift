import Foundation


class CollectionExpectation<T:Comparable> : BaseExpectation {
  var actual : T[][]
  
  init(actual : T[]) {
    self.actual = [actual]
  }
  
  func not() -> CollectionExpectation {
    self.reverse = !reverse
    return self
  }
  
  func toEqual(expected : T[]) {
    _assert(actual[0] == expected)
  }
}