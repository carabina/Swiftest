public protocol Numeric : Equatable {
  func +(lhs: Self, rhs: Self) -> Self
  func -(lhs: Self, rhs: Self) -> Self
  func *(lhs: Self, rhs: Self) -> Self
  func /(lhs: Self, rhs: Self) -> Self
  func %(lhs: Self, rhs: Self) -> Self
}

extension Double : Numeric {}
extension Float  : Numeric {}
extension Int    : Numeric {}
extension Int8   : Numeric {}
extension Int16  : Numeric {}
extension Int32  : Numeric {}
extension Int64  : Numeric {}
extension UInt   : Numeric {}
extension UInt8  : Numeric {}
extension UInt16 : Numeric {}
extension UInt32 : Numeric {}
extension UInt64 : Numeric {}

public class VoidPredicate<T:Equatable> {
  var initialVal : T

  let subject: VoidBlk
  let fn: Void -> T
  weak var parent: VoidMatcher?

  public init(fn: Void -> T, subject: VoidBlk, parent: VoidMatcher) {
    self.subject = subject
    self.initialVal = fn()
    self.fn = fn
  }

  public func from(expected: T) -> VoidPredicate {
    _assert(
      initialVal == expected,
      msg: "expected an original value of \(expected), but was \(initialVal)"
    )

    return self
  }

  public func to(expected: T) {
    subject()
    _assert(
      fn() == expected,
      msg: "expected \(initialVal) to change to \(expected), " +
      "changed to \(fn())"
    )
  }

  public func by<U:Numeric>(delta: U) {
    if let oldVal = initialVal as? U {
      subject()
      _assert(
        fn() as! U == oldVal + delta,
        msg: "expected change (by \(delta)) from \(initialVal) to " +
        "\(oldVal + delta), changed to \(fn())"
      )
    } else {
      _assert(false, msg: "couldn't compare \(fn().dynamicType)")
    }
  }

  public func _assert(cond: Bool, msg: String) {
    parent?.core.assert(fn: { cond }, msg: msg)
  }
}

public class VoidMatcher : Matcher {
  public typealias SubjectType = Void -> Void

  let subject: SubjectType?
  let core: MatcherCore

  required public init(subject: SubjectType?, callback: AssertionBlock, reverse: Bool) {
    self.subject = subject
    self.core = MatcherCore(callback: callback, reverse: reverse)
  }

  public func change<T:Equatable>(t: Void -> T) -> VoidPredicate<T> {
    return VoidPredicate(fn: t, subject: subject!, parent: self)
  }
}