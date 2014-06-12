import Foundation

class BoolExpectation : BaseExpectation {
  var actual : Bool
  
  init(actual : Bool) {
    self.actual = actual
  }
  
  func toBe(bool:Bool) {
    _assert(actual == bool)
  }
  
  func toBeFalse() {
    _assert(!actual)
  }
  
  func toBeTrue() {
    _assert(actual)
  }
  
  func not() -> BoolExpectation {
    self.reverse = !reverse
    return self
  }
  
  func toEqual(bool:Bool) { toBe(bool) }
}
