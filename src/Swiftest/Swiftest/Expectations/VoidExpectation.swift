public enum VoidMatcher<T:Comparable> {
  case Change(@autoclosure () -> T)
  
  func assertion(subject: VoidBlk, reverse: Bool, parent: VoidExpectation) -> VoidPredicate<T> {
    switch self {
    case .Change(let t):
      return VoidPredicate(predicate: t, subject: subject, parent: parent)
    }
  }
}

public class VoidExpectation : BaseExpectation {
  var subject: VoidBlk
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

  public override func getStatus() -> Status {
    return assertions.filter({ st in !st }).isEmpty ? .Pass : .Fail
  }

  public func _assert(cond: Bool, msg: String) {
    assertions.append(cond)
      if(self.msg == defaultMessage || !cond) {
      self.msg = msg
    }

    super.eval(cond)
  }
}

public func expect(fn: VoidBlk, file: String = __FILE__, line: Int = __LINE__) -> VoidExpectation {
  return Swiftest.context.currentExample().addExpectation(
    VoidExpectation(subject: fn, cursor: Cursor(file: file, line: line))
  )
}

