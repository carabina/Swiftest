import Foundation

class DictionaryExpectation<K, V where K:Hashable, V:Comparable> : BaseExpectation {
  var actual : Dictionary<K,V>[]
  
  init(actual : Dictionary<K,V>) {
    self.actual = [actual]
  }
  
  func not() -> DictionaryExpectation {
    self.reverse = !reverse
    return self
  }
  
  func toEqual(expected: Dictionary<K,V>) {
    _assert(actual[0] == expected)
  }
}
