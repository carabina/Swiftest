public class DictionaryExpectation<K:Hashable,V:Equatable> : Expectation {
  let subject: [K: V]
  
  public init(subject: [K: V], cursor: Cursor = nullCursor) {
    self.subject = subject
    super.init(cursor: cursor)
  }
  
  public func to(matcher: DictionaryMatcher<K,V>) {
    _assert(matcher.assertion(subject))
  }
  
  public func notTo(matcher: DictionaryMatcher<K,V>) {
    _assert(matcher.assertion(subject, reverse: true))
  }
}
