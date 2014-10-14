public class ArrayExpectation<T:Equatable> : Expectation {
  let subject : [T]
  
  public init(subject: [T], cursor: Cursor = nullCursor) {
    self.subject = subject
    super.init(cursor: cursor)
  }
  
  public func to(matcher: ArrayMatcher<T>) {
    _assert(matcher.assertion(subject))
  }
  
  public func notTo(matcher: ArrayMatcher<T>) {
    _assert(matcher.assertion(subject, reverse: true))
  }
}

//public func expect<T:Equatable>(
//  subject: [T],
//  file: String = __FILE__,
//  line: Int = __LINE__
//) -> ArrayExpectation<T> {
//  return Swiftest.context.currentExample.addExpectation(
//    ArrayExpectation(subject: subject, cursor: Cursor(file: file, line: line))
//  )
//}