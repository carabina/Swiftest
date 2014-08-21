public class StringExpectation<T> : ScalarComparison<String> {

  public override init(subject: String?, cursor: Cursor = nullCursor) {
    super.init(subject: subject, cursor: cursor)
  }

  public override func not() -> StringExpectation {
    self._reverse = !_reverse
    return self
  }

  public func toEndWith(suffix: String) {
    _assert(
      subject!.hasSuffix(suffix),
      msg: "expected <\(subject)> to\(_includeNot()) end with <\(suffix)>"
    )
  }

  public func toStartWith(prefix: String) {
    _assert(
      subject!.hasPrefix(prefix),
      msg: "expected <\(subject)> to\(_includeNot()) start with <\(prefix)>"
    )
  }

  public func toContain(fragment: String) {
    let msg = "expected <\(subject)> to\(_includeNot()) contain <\(fragment)>"
    
    if let range = subject?.rangeOfString(fragment) {
      _assert(!range.isEmpty, msg: msg)
    } else {
      _assert(false, msg: msg)
    }
  }
  
  public func toBeEmpty() -> Void {
    if let subject = subject? {
      _assert(subject.isEmpty, msg: "expected <\(subject)> to\(_includeNot()) be empty")
    } else {
      _assert(false, msg: "expected <nil array> to\(_includeNot()) be empty")
    }
  }
}

public func expect(
  subject: String?,
  file:String = __FILE__,
  line:Int = __LINE__
) -> StringExpectation<String> {
  return Swiftest.context.currentExample().addExpectation(
    StringExpectation(subject: subject, cursor: Cursor(file: file, line: line))
  )
}
