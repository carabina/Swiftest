public class Example : HasStatus {
  public var expectations: [Expectation] = []
  public let subject: String
  public let cursor : Cursor
  public let fn: VoidBlk
  
  let timer = Timer()
  
  public init(subject: String, fn: VoidBlk, cursor: Cursor = nullCursor) {
    self.subject = subject
    self.fn = fn
    self.cursor = cursor
  }
  
  func addExpectation<T:Expectation>(ex: T) -> T {
    self.expectations.append(ex)
    return ex
  }
  
  func status() -> Status {
    for st in [Status.Fail, Status.Pending] {
      if(Status.has(st, within: expectations)) { return st }
    }
    
    return expectations.isEmpty ? .Pending : .Pass
  }
}
