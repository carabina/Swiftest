let defaultMessage = "expectation failed"

public class Expectation : HasStatus {
  var _status = Status.Pending
  public var msg = defaultMessage
  
  public let cursor : Cursor
  
  init(cursor: Cursor = nullCursor) { self.cursor = cursor }
  
  public func status() -> Status { return _status }

  func eval(cond: Bool) { self._status = cond ? .Pass : .Fail }
  
  func _assert(assertion: Assertion) {
    self.msg = assertion.msg
    self.eval(assertion.call() ^ assertion.reverse)
  }
}
