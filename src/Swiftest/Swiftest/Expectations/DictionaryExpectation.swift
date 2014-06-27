class DictionaryExpectation<Key:Hashable, Value:Comparable> : BaseExpectation {
  typealias Dict = Dictionary<Key,Value>

  var subject : Dict[]

  init(subject : Dict, file:String = __FILE__, line:Int = __LINE__) {
    self.subject = [subject]
    super.init()
    self.cursor = Cursor(file: file, line: line)
  }

  func not() -> DictionaryExpectation {
    self._reverse = !_reverse
    return self
  }

  func toEqual(expected : Dict) {
    _assert(
      _subject() == expected,
      msg : "expected <\(_subject())> to\(_includeNot()) equal <\(expected)>")
  }

  func toHaveKey(key : Key) {
    _assert(
      _contains({ (k, v) in k == key }),
      msg: "expected <\(_subject())> to\(_includeNot()) have key <\(key)>"
    )
  }

  func toHaveValue(value : Value) {
    _assert(
      _contains({ (k, v) in v == value }),
      msg: "expected <\(_subject())> to\(_includeNot()) have key <\(value)>"
    )
  }

  func toContain(pair : Dict) {
    _assert(
      _contains({ (k, v) in [k : v] == pair }),
      msg: "expected <\(_subject())> to\(_includeNot()) have entry <\(pair)>"
    )
  }

  func _subject() -> Dict {
    return subject[0]
  }

  func _contains(fn : (Key, Value) -> Bool) -> Bool {
    var found = false

    for (key, value) in _subject() {
      if fn(key, value) { found = true }
    }

    return found
  }
}
