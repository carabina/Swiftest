public class StringExpectation : Expectation {
  let subject : String
  
  public init(subject: String, cursor: Cursor = nullCursor) {
    self.subject = subject
    super.init(cursor: cursor)
  }
  
  public func to(matcher: StringMatcher) {
    _assert(matcher.assertion(subject))
  }
  
  public func notTo(matcher: StringMatcher) {
    _assert(matcher.assertion(subject, reverse: true))
  }
}

//public func expect(
//  subject: String,
//  file: String = __FILE__,
//  line: Int = __LINE__
//) -> StringExpectation {
//  return Swiftest.context.currentExample.addExpectation(
//    StringExpectation(subject: subject, cursor: Cursor(file: file, line: line))
//  )
//}