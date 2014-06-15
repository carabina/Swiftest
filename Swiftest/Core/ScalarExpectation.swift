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
      _assert(
        _subject() == expected,
        msg : "expected \(_subject()) to\(_includeNot()) equal \(expected)"
      )
    }
    
    func toBeNil() {
      _assert(
        _subject() == nil,
        msg : "expected \(_subject()) to\(_includeNot()) be nil"
      )
    }
    
    func toBeGreaterThan(expected : T?) {
      _assert(
        _subject() > expected,
        msg: "expected \(_subject()) to\(_includeNot()) be greater than \(expected)"
      )
    }
    
    func toBeLessThan(expected : T?) {
      _assert(
        _subject() < expected,
        msg: "expected \(_subject()) to\(_includeNot()) be less than \(expected)"
      )
    }
    
    func toBeLessThanOrEqualTo(expected: T?) {
      _assert(
        _subject() <= expected,
        msg: "expected \(_subject()) to\(_includeNot()) be less than or equal to \(expected)"
      )
    }
    
    func toBeGreaterThanOrEqualTo(expected : T?) {
      _assert(
        _subject() >= expected,
        msg: "expected \(_subject()) to\(_includeNot()) be greater than or equal to \(expected)"
      )
    }
    
    func _subject() -> T? {
      return actual[0]
    }
  }
}