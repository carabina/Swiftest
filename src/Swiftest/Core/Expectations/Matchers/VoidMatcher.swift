public protocol Numeric: Equatable {
  func +(lhs: Self, rhs: Self) -> Self
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

public class ThrowableVoidPredicate<T:Equatable> {
  var initialVal : T

  let subject: Void throws -> Void
  let fn: Void -> T

  var parent: ThrowableVoidMatcher

  public init(fn: Void -> T, subject: Void throws -> Void, parent: ThrowableVoidMatcher) {
    self.parent = parent
    self.subject = subject
    self.initialVal = fn()
    self.fn = fn
  }

  public func from(expected: T) -> ThrowableVoidPredicate {
    _assert(
      initialVal == expected,
      msg: "expected an original value of \(expected), but was \(initialVal)"
    )

    return self
  }

  public func to(expected: T) throws {
    try subject()

    _assert(
      fn() == expected,
      msg: "expected \(initialVal) to change to \(expected), " +
      "changed to \(fn())"
    )
  }

  public func _assert(cond: Bool, msg: String) {
    parent.core.assert(fn: { return cond }, msg: msg)
  }
}

public class VoidPredicate<T:Equatable> {
  var initialVal : T

  let subject: Void -> Void
  let fn: Void -> T

  var parent: VoidMatcher

  public init(fn: Void -> T, subject: Void -> Void, parent: VoidMatcher) {
    self.parent = parent
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

  public func _assert(cond: Bool, msg: String) {
    parent.core.assert(fn: { return cond }, msg: msg)
  }
}

extension VoidPredicate where T:Numeric {
  public func by(delta: T) {
    let oldVal = initialVal
    subject()

    _assert(
      fn() == oldVal + delta,
      msg: "expected change (by \(delta)) from \(initialVal) to " +
      "\(oldVal + delta), changed to \(fn())"
    )
  }
}

public class ThrowableVoidMatcher : Matcher {
  public typealias SubjectType = (Void throws -> Void)

  let subject: SubjectType?
  let core: MatcherCore

  required public init(subject: SubjectType?, callback: AssertionBlock, reverse: Bool) {
    self.subject = subject
    self.core = MatcherCore(callback: callback, reverse: reverse)
  }

  public func throwError() {
    do {
      try subject!()
      core.assert(fn: { return false }, msg: "throw error")
    } catch {
      core.assert(fn: { return true }, msg: "throw error")
    }
  }

  public func throwError<T:ErrorType>(type: T) {
    do {
      try subject!()
      core.assert(
        fn: { return false },
        msg: "throw \(type) error, but no error was thrown"
      )
    } catch let err as T where "\(err)" == "\(type)" {
      core.assert(
        fn: { return true },
        msg: "throw \(type) error"
      )
    } catch let err {
      core.assert(
        fn: { return false },
        msg: "throw \(type) error, got \(err.dynamicType).\(err)"
      )
    }
  }
}

public class VoidMatcher: Matcher {
  public typealias SubjectType = (Void -> Void)

  let subject: SubjectType?
  let core: MatcherCore

  required public init(subject: SubjectType?, callback: AssertionBlock, reverse: Bool) {
    self.subject = subject
    self.core = MatcherCore(callback: callback, reverse: reverse)
  }

  public func change<T:Equatable>(fn: (Void -> T)) -> VoidPredicate<T> {
    return VoidPredicate(fn: fn, subject: subject!, parent: self)
  }
}
