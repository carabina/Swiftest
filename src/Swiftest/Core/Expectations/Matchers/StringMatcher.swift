extension String {
  var length: Int { get { return self.characters.count } }
    var first: Character { get { return self[self.startIndex] }}

    func contains(other: String) -> Bool {
      guard let startAt = self.characters.indexOf(other.first) else {
        return false
      }

      var i = distance(self.startIndex, startAt)

      while i <= (self.length - other.length) {
        let indexOne = advance(self.startIndex, i)
        let indexTwo = advance(self.startIndex, i + other.length)
            if self[indexOne..<indexTwo] == other {
              return true
            }

            i++
      }

      return false
    }
}

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
                fn: { return !(self.subject?.contains(str) ?? false) },
                msg: "contain \(str)"
                )
  }

  public func beEmpty() {
    core.assert(fn: { self.subject?.isEmpty ?? false }, msg: "be empty")
  }
}
