func describe(target : String, blk : Swiftest.DescribeBlk) -> Swiftest.Specification {
  return Swiftest.describe(target, blk)
}

func example(desc : String, blk : ExampleBlock = Swiftest.nullBlock) {
  Swiftest.context.current().example(desc, blk)
}

func it(desc: String, blk: ExampleBlock = Swiftest.nullBlock) {
  Swiftest.context.current().example(desc, blk)
}

func expect<T:Comparable>(subject : T) -> Swiftest.ScalarExpectation<T> {
  return Swiftest.context.currentExample().expect(subject)}

func expect<T:Comparable>(subject : T[]) -> Swiftest.ArrayExpectation<T> {
  return Swiftest.context.currentExample().expect(subject)
}

func expect(subject : Bool) -> Swiftest.BoolExpectation {
  return Swiftest.context.currentExample().expect(subject)
}

func expect<K:Comparable,V:Comparable>(
  subject : Dictionary<K,V>
) -> Swiftest.DictionaryExpectation<K, V> {
  return Swiftest.context.currentExample().expect(subject)
}
