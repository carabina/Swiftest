public class ScalarExpectation<T:Equatable> : BaseExpectation {
  var subject: T?
  
  public init(subject: T?, cursor: Cursor = nullCursor) {
    self.subject = subject
    super.init()
    self.cursor = cursor
  }
  
  public func not() -> ScalarExpectation {
    self._reverse = !_reverse
    return self
  }
  
  public func toEqual(expected: T?) {
    _assert(
      subject == expected,
      msg: "expected <\(subject)> to\(_includeNot()) equal <\(expected)>"
    )
  }
  
  public func toBeNil() {
    _assert(
      subject == nil,
      msg: "expected <\(subject)> to\(_includeNot()) be nil"
    )
  }
}

public func expect<T:Equatable>(subject: T?, file: String = __FILE__, line: Int = __LINE__) -> ScalarExpectation<T> {
  return Swiftest.context.currentExample().addExpectation(
    ScalarExpectation(subject: subject, cursor: Cursor(file: file, line: line))
  )
}