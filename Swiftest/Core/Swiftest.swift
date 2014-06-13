typealias DescribeBlk = (Void -> Void)

struct Swiftest {
  struct Context {
    var currentExample : Example
    var currentSpec : Specification
    
    init(currentExample : Example) {
      self.currentExample = currentExample
      self.currentSpec    = nullSpec
    }
  }
  
  static let reporter    = Swiftest.Reporter()
  static let nullExample = Example(desc : "null example") {}
  static let nullSpec    = Specification(name: "null spec")
  
  static var context     = Context(currentExample: nullExample)
  
  static func describe(target : String, blk : DescribeBlk) -> Specification {
    let spec = Specification(name: target)
    context.currentSpec = spec
    blk()
    context.currentSpec = nullSpec
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

func expect<K:Comparable,V:Comparable>(
  actual : Dictionary<K,V>
) -> Swiftest.DictionaryExpectation<K, V> {
  return Swiftest.context.currentExample.expect(actual)
}

func expect(actual : Bool) -> Swiftest.BoolExpectation {
  return Swiftest.context.currentExample.expect(actual)
}

func example(desc : String, blk : ExampleBlock) {
  Swiftest.context.currentSpec.example(desc, blk)
}

func it(desc: String, blk: ExampleBlock) {
  Swiftest.context.currentSpec.example(desc, blk)
}