public class BaseExpectation {
  let defaultMessage = "expectation failed"

  public var status = Status.Pending
  var _reverse = false
  var msg : String
  var example = nullExample
  var cursor = nullCursor

  func _assert(cond:Bool) {
    self.status = cond ^ _reverse ? .Pass : .Fail

    switch status {
    case .Pass: Swiftest.reporter.expectationPassed(self)
    case .Fail: Swiftest.reporter.expectationFailed(self)
    default: ()
    }
  }

  init() {
    msg = defaultMessage
  }

  func getStatus() -> Status {
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
