import Foundation

class BaseExpectation {
  var result = ExpectationResult()
  var reverse = false
  
  func _assert(cond:Bool) {
    result.assert(cond || reverse)
  }
}
