func expect<T:Comparable>(subject : T, file:String = __FILE__, line:Int = __LINE__) -> Swiftest.ScalarExpectation<T> {
  return __currentEx().expect(subject, file: file, line: line)}

func expect<T:Comparable>(subject : T[], file:String = __FILE__, line:Int = __LINE__) -> Swiftest.ArrayExpectation<T> {
  return __currentEx().expect(subject, file: file, line: line)
}

func expect(subject:Bool, file:String = __FILE__, line:Int = __LINE__) -> Swiftest.BoolExpectation {
  return __currentEx().expect(subject, file: file, line: line)
}

func expect<K:Comparable,V:Comparable>(
  subject : Dictionary<K,V>,
  file:String = __FILE__,
  line:Int = __LINE__
) -> Swiftest.DictionaryExpectation<K, V> {
  return __currentEx().expect(subject, file: file, line: line)
}

func __currentEx() -> Swiftest.Example {
  return Swiftest.context.currentExample()
}
