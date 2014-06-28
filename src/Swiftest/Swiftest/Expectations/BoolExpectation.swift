class BoolExpectation : BaseExpectation {
  var subject : Bool

  init(subject: Bool, file: String = __FILE__, line: Int = __LINE__) {
    self.subject = subject
    super.init()
    self.cursor = Cursor(file: file, line: line)
  }

  func toBe(bool: Bool) {
    _assert(
      subject == bool,
      msg: "expected <\(subject)> to\(_includeNot()) be <\(bool)>"
    )
  }

  func toBeFalse() {
    _assert(!subject, msg: "expected <\(subject)> to\(_includeNot()) be false")
  }

  func toBeTrue() {
    _assert(subject, msg: "expected <\(subject)> to\(_includeNot()) be true")
  }

  func not() -> BoolExpectation {
    self._reverse = !_reverse
    return self
  }

  func toEqual(bool: Bool) { toBe(bool) }
}
