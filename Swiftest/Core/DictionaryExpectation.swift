extension Swiftest {
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
      _assert(_subject() == expected, msg : "expected \(_subject()) to\(_includeNot()) equal \(expected)")
    }
    
    func toHaveKey(key : Key) {
      for k in _subject().keys {
        if(k == key) { return _assert(true) }
      }
      
      return _assert(false, msg: "expected \(_subject()) to\(_includeNot()) have key \(key)")
    }
    
    func toHaveValue(value : Value) {
      for v in _subject().values {
        if(v == value) { return _assert(true) }
      }
      
      return _assert(false, msg: "expected \(_subject()) to\(_includeNot()) have key \(value)")
    }
    
    func toContain(pair : Dict) {
      for (k, v) in _subject() {
        if([k : v] == pair) { return _assert(true) }
      }
      
      return _assert(false, msg: "expected \(_subject()) to have entry \(pair)")
    }
    
    func _subject() -> Dict {
      return actual[0]
    }
  }
}
