public enum DictionaryMatcher<K:Hashable, V:Equatable> {
  case Equal(@autoclosure () -> Dictionary<K, V>)
  case HaveKey(@autoclosure () -> K)
  case HaveValue(@autoclosure() -> V)
  case Contain(@autoclosure() -> Dictionary<K,V>)
  case BeEmpty

  func assertion(subject: Dictionary<K, V>, reverse: Bool = false) -> DictAssertion<K,V> {
    let build = DictAssertion.build(subject, reverse: reverse)
    
    switch self {
    case .Equal(let ex):
      return build(fn: { subject == ex() }, msg: "equal \(ex())" )
      
    case .HaveKey(let key):
      return build(
        fn: { self.contains(subject) { k, v in k == key() }},
        msg: "have key \(key())"
      )
      
    case .HaveValue(let val):
      return build(
        fn: { self.contains(subject) { k, v in v == val() }},
        msg: "have value \(val())"
      )
      
    case .Contain(let dict):
      return build(
        fn: { self.contains(subject) { k, v in [k:v] == dict() }},
        msg: "have pair \(dict())"
      )
      
    case .BeEmpty:
      return build(fn: { subject.isEmpty }, msg: "be empty")
    }
  }

  private func contains(subject: Dictionary<K,V>, fn: (K, V) -> Bool) -> Bool {
    return !filter(subject, fn).isEmpty
  }
  
}