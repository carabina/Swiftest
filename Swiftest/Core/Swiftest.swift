typealias DescribeBlk = (Void -> Void)

protocol SwiftestSuite {
  var spec : Swiftest.Specification { get }
}

struct Swiftest {
  static let reporter = Swiftest.Reporter()
  static let nullExample = Example(desc : "null example") {}
  static let nullSpec = Specification(name: "null spec")

  static var specs : Specification[]  = []
  static var specStack : Specification[] = []
  
  static func describe(target : String, blk : DescribeBlk) -> Specification {
    _addSpec(Specification(name: target))
    blk()

    return specStack.removeLast()
  }
  
  static func currentSpec() -> Specification {
    return specStack.count > 0 ? specStack[specStack.count - 1] : nullSpec
  }
  
  static func run() {
    for spec in specs { spec.run() }
  }
  
  static func register(suite : SwiftestSuite) {
    var spec = suite.spec
  }
  
  static func register(suites : SwiftestSuite[]) {
    suites.map({ s in s.spec })
  }
  
  static func _addSpec(spec : Specification) {
    specStack.append(spec)
    specs.append(spec)
  }
}

func describe(target : String, blk :DescribeBlk) -> Swiftest.Specification {
  return Swiftest.describe(target, blk)
}

func expect<T:Comparable>(actual : T) -> Swiftest.ScalarExpectation<T> {
  return Swiftest.currentSpec().currentExample.expect(actual)}

func expect<T:Comparable>(actual : T[]) -> Swiftest.ArrayExpectation<T> {
  return Swiftest.currentSpec().currentExample.expect(actual)
}

func expect<K:Comparable,V:Comparable>(
  actual : Dictionary<K,V>
) -> Swiftest.DictionaryExpectation<K, V> {
  return Swiftest.currentSpec().currentExample.expect(actual)
}

func expect(actual : Bool) -> Swiftest.BoolExpectation {
  return Swiftest.currentSpec().currentExample.expect(actual)
}

func example(desc : String, blk : ExampleBlock) {
  Swiftest.currentSpec().example(desc, blk)
}

func it(desc: String, blk: ExampleBlock) {
  Swiftest.currentSpec().it(desc, blk)
}