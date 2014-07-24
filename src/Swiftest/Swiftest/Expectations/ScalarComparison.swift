public class ScalarComparison<T:Comparable> : BaseExpectation {
  public var subject: T?

  public init(subject: T?, cursor: Cursor = nullCursor) {
    self.subject = subject
    super.init()
    self.cursor = cursor
  }

  public func not() -> ScalarComparison {
    self._reverse = !_reverse
    return self
  }

  public func toEqual(expected: T?) {
    _assert(
      subject == expected,
      msg : "expected <\(subject)> to\(_includeNot()) equal <\(expected)>"
    )
  }

  public func toBeNil() {
    _assert(
      subject == nil,
      msg : "expected <\(subject)> to\(_includeNot()) be nil"
    )
  }

  public func toBeGreaterThan(expected: T?) {
    _assert(
      subject > expected,
      msg: "expected <\(subject)> to\(_includeNot()) be greater than <\(expected)>"
    )
  }

  public func toBeLessThan(expected: T?) {
    _assert(
      subject < expected,
      msg: "expected <\(subject)> to\(_includeNot()) be less than <\(expected)>"
    )
  }

  public func toBeLessThanOrEqualTo(expected: T?) {
    _assert(
      subject <= expected,
      msg: "expected <\(subject)> to\(_includeNot()) be less than or equal to <\(expected)>"
    )
  }

  public func toBeGreaterThanOrEqualTo(expected: T?) {
    _assert(
      subject >= expected,
      msg: "expected <\(subject)> to\(_includeNot()) be greater than or equal to <\(expected)>"
    )
  }
}

