let defaultMessage = "expectation failed"

public class BaseExpectation {
  var status  = Status.Pending
  var msg     = defaultMessage
  var example = nullExample
  var cursor  = nullCursor

  func eval(cond:Bool) {
    self.status = cond ? .Pass : .Fail

    switch status {
    case .Pass: Swiftest.reporter.expectationPassed(self)
    case .Fail: Swiftest.reporter.expectationFailed(self)
    default: ()
    }
  }
  
  init(cursor: Cursor = nullCursor) { self.cursor = cursor }
  func getStatus() -> Status        { return self.status }
  
  func _assert(assertion: Assertion) {
    self.msg = assertion.msg
    self.eval(assertion.call() ^ assertion.reverse)
  }
}
