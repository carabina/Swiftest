class ArrayExpectation<T:Comparable> : BaseExpectation {
  typealias List = [T]
  var subject : List

  init(subject: List, cursor: Cursor = nullCursor) {
    self.subject = subject
    super.init()
    self.cursor = cursor
  }

  func not() -> ArrayExpectation {
    self._reverse = !_reverse
    return self
  }

  func toEqual(expected: List) {
    _assert(
      subject == expected,
      msg: "expected <\(subject)> to\(_includeNot()) equal <\(expected)>"
    )
  }

  func toContain(expected: T...) {
    _assert(
      !subject.filter() { (let subjectEl) in
        !expected.filter({ el in el == subjectEl }).isEmpty
      }.isEmpty,
      msg: "expected <\(subject)>\(_includeNot()) to contain <\(expected)>"
    )
  }
}

func expect<T:Comparable>(
  subject: [T],
  file: String = __FILE__,
  line: Int = __LINE__
) -> ArrayExpectation<T> {
  return Swiftest.context.currentExample().addExpectation(
    ArrayExpectation(subject: subject, cursor: Cursor(file: file, line: line))
  )
}

