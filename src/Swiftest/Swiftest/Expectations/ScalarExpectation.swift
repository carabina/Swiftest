class ScalarExpectation<T:Comparable> : BaseExpectation {
  var subject: T?

  init(subject: T?, cursor: Cursor = Util.nullCursor) {
    self.subject = subject
    super.init()
    self.cursor = cursor
  }

  func not() -> ScalarExpectation {
    self._reverse = !_reverse
    return self
  }

  func toEqual(expected: T?) {
    _assert(
      subject == expected,
      msg : "expected <\(subject)> to\(_includeNot()) equal <\(expected)>"
    )
  }

  func toBeNil() {
    _assert(
      subject == nil,
      msg : "expected <\(subject)> to\(_includeNot()) be nil"
    )
  }

  func toBeGreaterThan(expected: T?) {
    _assert(
      subject > expected,
      msg: "expected <\(subject)> to\(_includeNot()) be greater than <\(expected)>"
    )
  }

  func toBeLessThan(expected: T?) {
    _assert(
      subject < expected,
      msg: "expected <\(subject)> to\(_includeNot()) be less than <\(expected)>"
    )
  }

  func toBeLessThanOrEqualTo(expected: T?) {
    _assert(
      subject <= expected,
      msg: "expected <\(subject)> to\(_includeNot()) be less than or equal to <\(expected)>"
    )
  }

  func toBeGreaterThanOrEqualTo(expected: T?) {
    _assert(
      subject >= expected,
      msg: "expected <\(subject)> to\(_includeNot()) be greater than or equal to <\(expected)>"
    )
  }

}
