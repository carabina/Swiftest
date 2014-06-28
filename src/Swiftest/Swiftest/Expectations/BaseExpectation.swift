let nullCursor = Cursor(file: "Swiftest", line: 0)

class BaseExpectation {
  var status = ExampleStatus.Pending
  var _reverse = false
  var msg = "expectation failed"
  var example = Swiftest.nullExample

  var cursor = nullCursor

  func _assert(cond:Bool) {
    self.status = cond ^ _reverse ? .Pass : .Fail

    switch status {
    case .Pass: Swiftest.reporter.expectationPassed(self)
    case .Fail: Swiftest.reporter.expectationFailed(self)
    default: ()
    }
  }

  func getStatus() -> ExampleStatus {
    return self.status
  }

  func _assert(cond: Bool, msg: String) {
    self.msg = msg
    _assert(cond)
  }

  func _includeNot() -> String {
    return _reverse ? " not" : ""
  }
}
