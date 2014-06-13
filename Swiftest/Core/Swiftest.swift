typealias DescribeBlk = ((Swiftest.Specification) -> Void)

struct Swiftest {
  struct Context {
    var currentExample : Example
    var listeners : Swiftest.BaseListener[]
    
    init(currentExample : Example) {
      self.currentExample = currentExample
      self.listeners = []
    }
  }
  
  static var context = Context(currentExample: nullExample)
  static var nullExample = Example(desc : "null example") {}
  
  static func describe(target : String, blk : DescribeBlk) -> Specification {
    let spec = Specification(name: target)
    blk(spec)
    return spec
  }
}

func describe(target : String, blk : DescribeBlk) -> Swiftest.Specification {
  return Swiftest.describe(target, blk)
}

func expect<T:Comparable>(actual : T) -> Swiftest.ScalarExpectation<T> {
  return Swiftest.context.currentExample.expect(actual)}

func expect<T:Comparable>(actual : T[]) -> Swiftest.ArrayExpectation<T> {
  return Swiftest.context.currentExample.expect(actual)
}

func expect<K:Comparable,V:Comparable>(actual : Dictionary<K,V>) -> Swiftest.DictionaryExpectation<K, V> {
  return Swiftest.context.currentExample.expect(actual)
}

func expect(actual : Bool) -> Swiftest.BoolExpectation {
  return Swiftest.context.currentExample.expect(actual)
}
