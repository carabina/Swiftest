let defaultMessage = "expectation failed"

public class ExpectationResult : HasStatus {
  public var status = Status.Pending
  public var msg = defaultMessage
  public let cursor: Cursor

  init(cursor: Cursor) { self.cursor = cursor }

  func assert(a: Assertion) {
    self.msg = a.msg
    self.status = (a.call() != a.reverse) ? .Pass : .Fail
  }
}

public protocol Expectable {
  var result : ExpectationResult { get }
}

public class Expectation<T, M:Matcher where M.SubjectType == T> : Expectable {
  let subject: T?
  public let result: ExpectationResult

  public var to : M {
    get { return M(subject: subject, callback: result.assert, reverse: false) }
  }

  public var notTo : M {
    get { return M(subject: subject, callback: result.assert, reverse: true) }
  }

  public init(subject: T?, cursor: Cursor = nullCursor) {
    self.subject = subject
    self.result = ExpectationResult(cursor: cursor)
  }
}

public class ArrayExpectation<T:Equatable> : Expectable {
  let subject: [T]?
  public let result: ExpectationResult

  public var to : ArrayMatcher<T> {
    get { return ArrayMatcher(subject: subject, callback: result.assert, reverse: false) }
  }

  public var notTo : ArrayMatcher<T> {
    get { return ArrayMatcher(subject: subject, callback: result.assert, reverse: true) }
  }

  public init(subject: [T]?, cursor: Cursor = nullCursor) {
    self.subject = subject
    self.result = ExpectationResult(cursor: cursor)
  }
}

public class DictionaryExpectation<K:Hashable, V:Equatable> : Expectable {
  let subject: [K : V]?
  public let result: ExpectationResult

  public var to : DictionaryMatcher<K, V> {
    get { return DictionaryMatcher(subject: subject, callback: result.assert, reverse: false) }
  }

  public var notTo : DictionaryMatcher<K, V> {
    get { return DictionaryMatcher(subject: subject, callback: result.assert, reverse: true) }
  }

  public init(subject: [K : V]?, cursor: Cursor = nullCursor) {
    self.subject = subject
    self.result = ExpectationResult(cursor: cursor)
  }
}