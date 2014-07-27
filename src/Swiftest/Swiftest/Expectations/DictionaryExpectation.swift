public class DictionaryExpectation<Key:Hashable, Value:Equatable> : BaseExpectation {
  public typealias Dict = Dictionary<Key,Value>

  var subject : Dict

  public init(subject : Dict, cursor: Cursor = nullCursor) {
    self.subject = subject
    super.init()
    self.cursor = cursor
  }

  public func not() -> DictionaryExpectation {
    self._reverse = !_reverse
    return self
  }

  public func toEqual(expected: Dict) {
    _assert(
      subject == expected,
      msg : "expected <\(subject)> to\(_includeNot()) equal <\(expected)>")
  }

  public func toHaveKey(key: Key) {
    _assert(
      _contains({ (k, v) in k == key }),
      msg: "expected <\(subject)> to\(_includeNot()) have key <\(key)>"
    )
  }

  public func toHaveValue(value: Value) {
    _assert(
      _contains({ (k, v) in v == value }),
      msg: "expected <\(subject)> to\(_includeNot()) have key <\(value)>"
    )
  }

  public func toContain(pair: Dict) {
    _assert(
      _contains({ (k, v) in [k : v] == pair }),
      msg: "expected <\(subject)> to\(_includeNot()) have entry <\(pair)>"
    )
  }
  
  public func toBeEmpty() {
    _assert(
      subject.isEmpty,
      msg: "expected <\(subject) to\(_includeNot()) be empty"
    )
  }

  func _contains(fn: (Key, Value) -> Bool) -> Bool {
    var found = false

    for (key, value) in subject {
      if fn(key, value) { found = true }
    }

    return found
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
