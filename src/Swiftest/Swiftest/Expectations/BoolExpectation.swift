public class BoolExpectation : BaseExpectation {
  public var subject : Bool

  public init(subject: Bool, cursor: Cursor = nullCursor) {
    self.subject = subject
    super.init()
    self.cursor = cursor
  }

  public func toBe(bool: Bool) {
    _assert(
      subject == bool,
      msg: "expected <\(subject)> to\(_includeNot()) be <\(bool)>"
    )
  }

  public func toBeFalse() {
    _assert(!subject, msg: "expected <\(subject)> to\(_includeNot()) be false")
  }

  public func toBeTrue() {
    _assert(subject, msg: "expected <\(subject)> to\(_includeNot()) be true")
  }

  public func not() -> BoolExpectation {
    self._reverse = !_reverse
    return self
  }

  public func toEqual(bool: Bool) { toBe(bool) }
}

public func expect(
  subject: Bool,
  file: String = __FILE__,
  line: Int = __LINE__
) -> BoolExpectation {
  return Swiftest.context.currentExample().addExpectation(
    BoolExpectation(subject: subject, cursor: Cursor(file: file, line: line))
  )
}
