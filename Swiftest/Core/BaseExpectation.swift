class BaseExpectation {
  var result = ExpectationResult()
  var _reverse = false
  
  func _assert(cond:Bool) {
    result.assert(cond ^ _reverse)
  }
}
