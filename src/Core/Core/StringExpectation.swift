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

