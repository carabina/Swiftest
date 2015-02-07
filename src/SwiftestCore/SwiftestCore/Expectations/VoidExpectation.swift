public class VoidExpectation : Expectation {
  let subject : VoidBlk
  var assertions : [Bool] = []
  
  public init(subject: VoidBlk, cursor: Cursor = nullCursor) {
    self.subject = subject
    super.init(cursor: cursor)
  }
  
  public func to<T:Comparable>(matcher: VoidMatcher<T>) -> VoidPredicate<T> {
    return matcher.assertion(subject, reverse: false, parent: self)
  }
  
  public func notTo<T:Comparable>(matcher: VoidMatcher<T>) -> VoidPredicate<T> {
    return matcher.assertion(subject, reverse: true, parent: self)
  }
  
  override public var status: Status {
    get { return self.assertions.filter({ !$0 }).isEmpty ? .Pass : .Fail }
  }
  
  public func _assert(cond: Bool, msg: String) {
    self.assertions.append(cond)
    if(self.msg == defaultMessage || !cond) { self.msg = msg }
    
    super.eval(cond)
  }
}

