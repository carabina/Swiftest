import Foundation

class ExpectationResult {
  var status = ExampleStatus.Pending
  
  func assert(cond : Bool) {
    self.status = cond ? ExampleStatus.Pass : ExampleStatus.Fail
  }
}

class BaseExpectation {
  var result = ExpectationResult()
  var reverse = false
  
  func assert(cond:Bool) {
    result.assert(cond || reverse)
  }
}

class ScalarExpectation<T:Comparable> : BaseExpectation {
  var actual : T[]
  
  init(actual : T) {
    self.actual = [actual]
  }
  
  func not() -> ScalarExpectation {
    self.reverse = !reverse
    return self
  }
  
  func toEqual(expected : T) {
    assert(actual[0] == expected)
  }
}

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
    assert(actual[0] == expected)
  }
}

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
    assert(actual[0] == expected)
  }
}
