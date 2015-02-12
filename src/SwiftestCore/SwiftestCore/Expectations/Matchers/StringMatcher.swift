public class StringMatcher : Matcher {
  typealias SubjectType = String

  let subject: String?
  let core: MatcherCore

  required public init(subject: String?, callback: AssertionBlock, reverse: Bool) {
    self.subject = subject
    self.core = MatcherCore(callback: callback, reverse: reverse)
  }

  public func startWith(prefix: String) {
    core.assert(
      fn: { return self.subject?.hasPrefix(prefix) ?? false },
      msg: "start with \(prefix)"
    )
  }

  public func endWith(suffix: String) {
    core.assert(fn: { return self.subject?.hasSuffix(suffix) ?? false },
      msg: "end with \(suffix)")
  }

  public func contain(str: String) {
    core.assert(
      fn: { return !(self.subject?.rangeOfString(str)?.isEmpty ?? true) },
      msg: "contain \(str)"
    )
  }

  public func beEmpty() {
    core.assert(fn: { self.subject?.isEmpty ?? false }, msg: "be empty")
  }
}