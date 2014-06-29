func expect<T:Comparable>(
  subject: T,
  file:String = __FILE__,
  line:Int = __LINE__
) -> ScalarExpectation<T> {
  return __currentEx().expect(subject, cursor: Cursor(file: file, line: line))
}

func expect<T:Comparable>(
  subject: T[],
  file: String = __FILE__,
  line: Int = __LINE__
) -> ArrayExpectation<T> {
  return __currentEx().expect(subject, cursor: Cursor(file: file, line: line))
}

func expect(
  subject: Bool,
  file: String = __FILE__,
  line: Int = __LINE__
) -> BoolExpectation {
  return __currentEx().expect(subject, cursor: Cursor(file: file, line: line))
}

func expect<K:Comparable,V:Comparable>(
  subject: Dictionary<K,V>,
  file: String = __FILE__,
  line: Int = __LINE__
) -> DictionaryExpectation<K, V> {
  return __currentEx().expect(subject, cursor: Cursor(file: file, line: line))
}

func __currentEx() -> Example {
  return Swiftest.context.currentExample()
}
