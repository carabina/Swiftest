public typealias Assertion = (call: Void -> Bool, msg: String, reverse: Bool)
public typealias AssertionBlock = Assertion -> Void

public protocol Matcher {
  typealias SubjectType
  init(subject: SubjectType?, callback: AssertionBlock, reverse: Bool)
}

class MatcherCore {
  let callback : AssertionBlock
  let reverse  : Bool

  init(callback: AssertionBlock, reverse: Bool) {
    self.callback = callback
    self.reverse = reverse
  }

  func assert(# fn: Void -> Bool, msg: String) {
    callback(Assertion(call: fn, msg: msg, reverse: reverse))
  }
}