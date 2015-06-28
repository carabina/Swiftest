public class DictionaryMatcher<K:Hashable, V:Equatable> : Matcher {
  public typealias SubjectType = [K : V]

  let subject: SubjectType?
  let core: MatcherCore

  required public init(subject: SubjectType?, callback: AssertionBlock, reverse: Bool) {
    self.subject = subject
    self.core = MatcherCore(callback: callback, reverse: reverse)
  }

  public func equal(expected: [K : V]) {
    core.assert(fn: { self.subject! == expected }, msg: "equal \(expected)")
  }

  public func beEmpty() {
    core.assert(fn: { self.subject?.isEmpty ?? false },
      msg: "be empty")
  }

  public func haveKey(key: K) {
    core.assert(fn: { self.contains() { k, v in k == key }},
      msg: "to have key \(key)")
  }

  public func haveValue(value: V) {
    core.assert(fn: { self.contains() { k, v in v == value }},
      msg: "to have value \(value)")
  }

  public func contain(dict: [K: V]) {
    core.assert(fn: { self.contains() { k, v in [k:v] == dict }},
      msg: "contain \(dict)")
  }

  private func contains(fn: (K, V) -> Bool) -> Bool {
    if let subject = self.subject {
      return !subject.filter(fn).isEmpty
    }

    return false
  }
}
