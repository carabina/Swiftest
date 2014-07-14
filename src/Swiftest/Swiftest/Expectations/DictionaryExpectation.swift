class DictionaryExpectation<Key:Hashable, Value:Equatable> : BaseExpectation {
  typealias Dict = Dictionary<Key,Value>

  var subject : Dict

  init(subject : Dict, cursor: Cursor = nullCursor) {
    self.subject = subject
    super.init()
    self.cursor = cursor
  }

  func not() -> DictionaryExpectation {
    self._reverse = !_reverse
    return self
  }

  func toEqual(expected: Dict) {
    _assert(
      subject == expected,
      msg : "expected <\(subject)> to\(_includeNot()) equal <\(expected)>")
  }

  func toHaveKey(key: Key) {
    _assert(
      _contains({ (k, v) in k == key }),
      msg: "expected <\(subject)> to\(_includeNot()) have key <\(key)>"
    )
  }

  func toHaveValue(value: Value) {
    _assert(
      _contains({ (k, v) in v == value }),
      msg: "expected <\(subject)> to\(_includeNot()) have key <\(value)>"
    )
  }

  func toContain(pair: Dict) {
    _assert(
      _contains({ (k, v) in [k : v] == pair }),
      msg: "expected <\(subject)> to\(_includeNot()) have entry <\(pair)>"
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


func expect<K:Comparable,V:Comparable>(
  subject: Dictionary<K,V>,
  file: String = __FILE__,
  line: Int = __LINE__
) -> DictionaryExpectation<K, V> {
  return Swiftest.context.currentExample().addExpectation(
    DictionaryExpectation(subject: subject, cursor: Cursor(file: file, line: line))
  )
}
