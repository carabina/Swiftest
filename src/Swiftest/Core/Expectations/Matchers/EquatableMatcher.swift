public class EquatableMatcher<T:Equatable> : Matcher {
  public typealias SubjectType = T

  let subject: T?
  let core: MatcherCore

  required public init(subject: T?, callback: AssertionBlock, reverse: Bool) {
    self.subject = subject
    self.core = MatcherCore(callback: callback, reverse: reverse)
  }

  public func equal(expected: T) {
    core.assert(
      fn: { return self.subject == expected },
      msg: "equal \(expected)"
    )
  }

  public func beNil() {
    core.assert(fn: { return self.subject == nil }, msg: "be nil")
  }
}
