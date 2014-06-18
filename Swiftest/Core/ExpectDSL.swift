func expect<T:Comparable>(subject : T, file:String = __FILE__, line:Int = __LINE__) -> Swiftest.ScalarExpectation<T> {
  return Swiftest.context.currentExample().expect(subject, file: file, line: line)}

func expect<T:Comparable>(subject : T[], file:String = __FILE__, line:Int = __LINE__) -> Swiftest.ArrayExpectation<T> {
  return Swiftest.context.currentExample().expect(subject)
}

func expect(subject:Bool, file:String = __FILE__, line:Int = __LINE__) -> Swiftest.BoolExpectation {
  return Swiftest.context.currentExample().expect(subject)
}

func expect<K:Comparable,V:Comparable>(
  subject : Dictionary<K,V>,
  file:String = __FILE__,
  line:Int = __LINE__
  ) -> Swiftest.DictionaryExpectation<K, V> {
    return Swiftest.context.currentExample().expect(subject)
}
