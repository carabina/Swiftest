public class DictionaryExpectation<K:Hashable,V:Equatable> : Expectation {
  let subject: Dictionary<K,V>
  
  public init(subject: Dictionary<K,V>, cursor: Cursor = nullCursor) {
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

//public func expect<K:Hashable,V:Equatable>(
//  subject: Dictionary<K,V>,
//  file: String = __FILE__,
//  line: Int = __LINE__
//) -> DictionaryExpectation<K,V> {
//  return Swiftest.context.currentExample.addExpectation(
//    DictionaryExpectation(subject: subject, cursor: Cursor(file: file, line: line))
//  )
//}