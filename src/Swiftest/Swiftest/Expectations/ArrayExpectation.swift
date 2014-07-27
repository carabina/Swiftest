public class ArrayExpectation<T:Equatable> : BaseExpectation {
  typealias List = [T]
  var subject : List

  public init(subject: List, cursor: Cursor = nullCursor) {
    self.subject = subject
    super.init()
    self.cursor = cursor
  }

  public func not() -> ArrayExpectation {
    self._reverse = !_reverse
    return self
  }

  public func toEqual(expected: List) {
    _assert(
      subject == expected,
      msg: "expected <\(subject)> to\(_includeNot()) equal <\(expected)>"
    )
  }

  public func toContain(expected: T...) {
    _assert(
      subject.filter() { (let subjectEl) in
        !expected.filter({ el in el == subjectEl }).isEmpty
      }.count == expected.count,
      msg: "expected <\(subject)>\(_includeNot()) to contain <\(expected)>"
    )
  }
  
  public func toBeEmpty() {
    _assert(subject.isEmpty, msg: "expected \(subject) to\(_includeNot()) be empty")
  }
}

public func expect<T:Equatable>(
  subject: [T],
  file: String = __FILE__,
  line: Int = __LINE__
) -> ArrayExpectation<T> {
  return Swiftest.context.currentExample().addExpectation(
    ArrayExpectation(subject: subject, cursor: Cursor(file: file, line: line))
  )
}

