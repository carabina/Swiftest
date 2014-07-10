class StringExpectation<T> : ScalarExpectation<String> {

  init(subject: String?, cursor: Cursor = nullCursor) {
    super.init(subject: subject, cursor: cursor)
  }

  override func not() -> StringExpectation {
    self._reverse = !_reverse
    return self
  }

  func toEndWith(suffix: String) {
    _assert(
      subject!.hasSuffix(suffix),
      msg: "expected <\(subject)> to\(_includeNot()) end with <\(suffix)>"
    )
  }

  func toStartWith(prefix: String) {
    _assert(
      subject!.hasPrefix(prefix),
      msg: "expected <\(subject)> to\(_includeNot()) start with <\(prefix)>"
    )
  }

  func toContain(fragment: String) {
    _assert(
      !subject!.rangeOfString(fragment).isEmpty,
      msg: "expected <\(subject)> to\(_includeNot()) contain <\(fragment)>"
    )
  }
}

func expect(
  subject: String?,
  file:String = __FILE__,
  line:Int = __LINE__
) -> StringExpectation<String> {
  return Swiftest.context.currentExample().addExpectation(
    StringExpectation(subject: subject, cursor: Cursor(file: file, line: line))
  )
}