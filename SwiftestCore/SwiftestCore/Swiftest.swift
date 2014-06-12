import Foundation

typealias DescribeBlk = ((Specification) -> Void)

struct SwiftestContext {
  var currentExample : Example
}

struct Swiftest {
  static var context = SwiftestContext(currentExample: nullExample)
  static var nullExample = Example(desc : "null example") {}
  
  static func describe(target : String, blk : DescribeBlk) -> Specification {
    let spec = Specification(name: target)
    blk(spec)
    return spec
  }
}

func describe(target : String, blk : DescribeBlk) -> Specification {
  return Swiftest.describe(target, blk)
}

func expect<T:Comparable>(actual : T) -> ScalarExpectation<T> {
  return Swiftest.context.currentExample.expect(actual)}

func expect<T:Comparable>(actual : T[]) -> CollectionExpectation<T> {
  return Swiftest.context.currentExample.expect(actual)
}

func expect<K:Comparable,V:Comparable>(actual : Dictionary<K,V>) -> DictionaryExpectation<K, V> {
  return Swiftest.context.currentExample.expect(actual)
}

func expect(actual : Bool) -> BoolExpectation {
  return Swiftest.context.currentExample.expect(actual)
}