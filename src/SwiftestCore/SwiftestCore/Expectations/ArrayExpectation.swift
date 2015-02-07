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

