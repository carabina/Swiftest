extension Swiftest {
  
class BaseExpectation {
  var result = Swiftest.ExpectationResult()
  var _reverse = false

  func _assert(cond:Bool) {
    result.assert(cond ^ _reverse)
  }
}
}