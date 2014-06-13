extension Swiftest {
  class ScalarExpectation<T:Comparable> : BaseExpectation {
    var actual : T?[]
    
    init(actual : T?) {
      self.actual = [actual]
    }
    
    func not() -> ScalarExpectation {
      self._reverse = !_reverse
      return self
    }
    
    func toEqual(expected : T?) {
      _assert(actual[0] == expected)
    }
    
    func toBeNil() {
      _assert(_subject() == nil)
    }
    
    func toBeGreaterThan(expected : T?) {
      _assert(_subject() > expected)
    }
    
    func toBeLessThan(expected : T?) {
      _assert(_subject() < expected)
    }
    
    func toBeLessThanOrEqualTo(expected: T?) {
      _assert(_subject() < expected)
    }
    
    func toBeGreaterThanOrEqualTo(expected : T?) {
      _assert(_subject() >= expected)
    }
    
    func _subject() -> T? {
      return actual[0]
    }
  }
}