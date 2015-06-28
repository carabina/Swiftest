public class Example : HasStatus {
  public let subject: String
  public let cursor : Cursor
  public let fn: VoidBlk

  public var expectations: [ExpectationResult] = []
  public var status: Status {
    get {
      for st in [Status.Fail, Status.Pending] {
        if !(expectations.filter({ $0.status == st })).isEmpty { return st }
      }

      return expectations.isEmpty ? .Pending : .Pass
    }
  }

  public init(subject: String, fn: VoidBlk, cursor: Cursor = nullCursor) {
    self.subject = subject
    self.fn = fn
    self.cursor = cursor
  }

  public func addExpectation(ex: ExpectationResult) {
    self.expectations.append(ex)
  }
}
