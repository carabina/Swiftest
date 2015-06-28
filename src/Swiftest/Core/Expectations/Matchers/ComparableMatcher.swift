public class ComparableMatcher<T:Comparable> : Matcher {
  typealias SubjectType = T

  let subject: T?
  let core: MatcherCore

  required public init(subject: T?, callback: AssertionBlock, reverse: Bool) {
    self.subject = subject
    self.core = MatcherCore(callback: callback, reverse: reverse)
  }

  public func beGreaterThan(expected: T) {
    core.assert(fn: { return self.subject > expected },
      msg: "equal \(expected)")
  }

  public func beLessThan(expected: T) {
    core.assert(fn: { return self.subject < expected },
      msg: "be less than \(expected)")
  }

  public func beGreaterThanOrEqual(expected: T) {
    core.assert(fn: { return self.subject >= expected },
      msg: "be greater than or equal to \(expected)")
  }

  public func beLessThanOrEqual(expected: T) {
    core.assert(fn: { return self.subject <= expected },
      msg: "be greater than or equal to \(expected)")
  }

  public func beBetween(lower: T, _ upper: T) {
    core.assert(fn: { return self.subject > lower && self.subject < upper },
      msg: "be between \(lower) and \(upper)")
  }

  public func beWithin(lower: T, upper: T) {
    core.assert(fn: { return self.subject >= lower && self.subject <= upper },
      msg: "be within the range of \(lower) to \(upper)")
  }
}