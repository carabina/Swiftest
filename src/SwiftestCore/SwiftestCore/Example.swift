public class Example : HasStatus {
  let timer = Timer()
  
  public let subject: String
  public let cursor : Cursor
  public let fn: VoidBlk
  
  public var expectations: [Expectation] = []
  public var status: Status {
    get {
      for st in [Status.Fail, Status.Pending] {
        if(Status.has(st, within: expectations)) { return st }
      }
    
      return expectations.isEmpty ? .Pending : .Pass
    }
  }
  
  public init(subject: String, fn: VoidBlk, cursor: Cursor = nullCursor) {
    self.subject = subject
    self.fn = fn
    self.cursor = cursor
  }
  
  public func addExpectation<T:Expectation>(ex: T) -> T {
    self.expectations.append(ex)
    return ex
  }
}
