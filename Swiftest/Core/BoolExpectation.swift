extension Swiftest {
  class BoolExpectation : BaseExpectation {
    var actual : Bool
    
    init(actual : Bool) {
      self.actual = actual
    }
    
    func toBe(bool:Bool) {
      _assert(
        actual == bool,
        msg: "expected \(actual) to\(_includeNot()) be \(bool)"
      )
    }
    
    func toBeFalse() {
      _assert(!actual, msg: "expected \(actual) to\(_includeNot()) be false")
    }
    
    func toBeTrue() {
      _assert(actual, msg : "expected \(actual) to\(_includeNot()) be true")
    }
    
    func not() -> BoolExpectation {
      self._reverse = !_reverse
      return self
    }
    
    func toEqual(bool:Bool) { toBe(bool) }
  }
}