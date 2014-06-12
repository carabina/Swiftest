import Foundation

class DictionaryExpectation<Key:Hashable, Value:Comparable> : BaseExpectation {
  typealias Dict = Dictionary<Key,Value>
  
  var actual : Dict[]
  
  init(actual : Dict) {
    self.actual = [actual]
  }
  
  func not() -> DictionaryExpectation {
    self._reverse = !_reverse
    return self
  }
  
  func toEqual(expected : Dict) {
    _assert(_subject() == expected)
  }
  
  func toHaveKey(key : Key) {
    for k in _subject().keys {
      if(k == key) { return _assert(true) }
    }

    return(_assert(false))
  }
  
  func toHaveValue(value : Value) {
    for v in _subject().values {
      if(v == value) { return _assert(true) }
    }
    
    return(_assert(false))
  }
  
  func _subject() -> Dict {
    return actual[0]
  }
}
