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
    _assert(_subject() == expected)
  }
  
  func toContain(expected : T) {
    _assert(_subject().filter({ el in el == expected }).count > 0)
  }
  
  func _subject() -> T[] {
    return actual[0]
  }
}