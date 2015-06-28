public class ArrayMatcher<T:Equatable> : Matcher {
  public typealias SubjectType = [T]

  let subject: [T]?
  let core: MatcherCore

  required public init(subject: [T]?, callback: AssertionBlock, reverse: Bool) {
    self.subject = subject
    self.core = MatcherCore(callback: callback, reverse: reverse)
  }

  public func beEmpty() {
    core.assert(fn: { self.subject?.isEmpty ?? false }, msg: "be empty")
  }

  public func equal(expected: [T]) {
    core.assert(fn: { self.subject! == expected }, msg: "equal \(expected)")
  }

  public func contain(expected: T...) {
    core.assert(fn: {
      self.subject?.filter({
        el in !expected.filter({ $0 == el }).isEmpty
      }).count == expected.count
    }, msg: "contain each of \(expected)")
  }
}
