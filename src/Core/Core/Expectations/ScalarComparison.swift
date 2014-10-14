public class ScalarComparison<T:Comparable> : Expectation {
  var subject: T?

  init(subject: T?, cursor: Cursor = nullCursor) {
    self.subject = subject
    super.init(cursor: cursor)
  }
  
  public func to(matcher: ComparableMatcher<T>) {
    _assert(matcher.assertion(subject))
  }
  
  public func notTo(matcher: ComparableMatcher<T>) {
    _assert(matcher.assertion(subject, reverse: true))
  }
}

//public func expect<T:Comparable>(
//  subject: T?,
//  file: String = __FILE__,
//  line: Int = __LINE__
//) -> ScalarComparison<T> {
//  return Swiftest.context.currentExample.addExpectation(
//    ScalarComparison(subject: subject, cursor: Cursor(file: file, line: line))
//  )
//}