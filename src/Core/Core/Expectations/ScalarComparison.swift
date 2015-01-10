public class ScalarComparison<T:Comparable> : Expectation {
  var subject: T?

  public init(subject: T?, cursor: Cursor = nullCursor) {
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

