extension String {
  var length: Int { get { return characters.count } }
  var first: Character { get { return self[self.startIndex] }}
  var last: Character { get { return self[self.endIndex.predecessor()] }}

  func contains(fragment: String) -> Bool {
    return self.indexOf(fragment) != nil
  }

  func indexOf(fragment: String) -> String.Index? {
    guard let startAt = characters.indexOf(fragment.first) else {
      return nil
    }

    var i = startIndex.distanceTo(startAt)

    while i <= (self.length - fragment.length) {
      let range = Range(
        start: startIndex.advancedBy(i),
        end:   startIndex.advancedBy(i + fragment.length)
      )

      if self[range] == fragment { return range.startIndex }

      i++
    }

    return nil
  }
}

public class StringMatcher : Matcher {
  public typealias SubjectType = String

  let subject: String?
  let core: MatcherCore

  required public init(subject: String?, callback: AssertionBlock, reverse: Bool) {
    self.subject = subject
    self.core = MatcherCore(callback: callback, reverse: reverse)
  }

  public func startWith(prefix: String) {
    core.assert(
      fn: { return self.subject?.indexOf(prefix) == self.subject?.startIndex },
      msg: "start with \(prefix)"
    )
  }

  public func endWith(suffix: String) {
    core.assert(
      fn: { return self.subject?.indexOf(suffix) == self.subject?.endIndex.advancedBy(-1 * suffix.length) },
      msg: "end with \(suffix)"
    )
  }

  public func contain(str: String) {
    core.assert(
              fn: { return (self.subject?.contains(str) ?? false) },
              msg: "contain \(str)"
              )
  }

  public func beEmpty() {
    core.assert(fn: { self.subject?.isEmpty ?? false }, msg: "be empty")
  }
}
