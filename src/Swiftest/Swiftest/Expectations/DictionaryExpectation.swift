public enum DictionaryMatcher<K:Hashable, V:Equatable> {
  case Equal(@autoclosure () -> Dictionary<K, V>)
  case HaveKey(@autoclosure () -> K)
  case HaveValue(@autoclosure() -> V)
  case Contain(@autoclosure() -> Dictionary<K,V>)
  case BeEmpty
  

  func assertion(subject: Dictionary<K, V>, reverse: Bool = false) -> DictAssertion<K,V> {
    let build = DictionaryAssertionBuild(subject: subject, reverse: reverse).build
    switch self {
    
    case .Equal(let ex):
      return build(ex(), { subject == ex() }, "equal \(ex())" )

    case .HaveKey(let key):
      return build(subject, { self.contains(subject) { k, v in k == key() }}, "have key \(key())")

    case .HaveValue(let val):
      return build(subject, { self.contains(subject) { k, v in v == val() }}, "have value \(val())")

    case .Contain(let dict):
      return build(subject, { self.contains(subject) { k, v in [k:v] == dict() }}, "have pair \(dict())")

    case .BeEmpty:
      return build(subject, { subject.isEmpty }, "be empty")
    
    }
  }
  
  func contains(subject: Dictionary<K,V>, fn: (K, V) -> Bool) -> Bool {
    return !filter(subject, fn).isEmpty
  }

}

public class DictionaryExpectation<Key:Hashable, Value:Equatable> : BaseExpectation {
  var subject : Dictionary<Key,Value>

  public init(subject : Dictionary<Key,Value>, cursor: Cursor = nullCursor) {
    self.subject = subject
    super.init(cursor: cursor)
  }
  
  public func to(matcher: DictionaryMatcher<Key,Value>) {
    _assert(matcher.assertion(subject))
  }
  
  public func notTo(matcher: DictionaryMatcher<Key,Value>) {
    _assert(matcher.assertion(subject, reverse: true))
  }
}


public func expect<K:Comparable,V:Comparable>(
  subject: Dictionary<K,V>,
  file: String = __FILE__,
  line: Int = __LINE__
) -> DictionaryExpectation<K, V> {
  return Swiftest.context.currentExample().addExpectation(
    DictionaryExpectation(subject: subject, cursor: Cursor(file: file, line: line))
  )
}
