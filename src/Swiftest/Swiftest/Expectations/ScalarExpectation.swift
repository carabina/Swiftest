public enum EquatableMatcher<T:Equatable> {
  case Be(@autoclosure () -> T?)
  case Equal(@autoclosure () -> T?)
  case BeNil

  func assertion(subject: T?, reverse: Bool = false) -> BaseAssertion<T> {
    let build = AssertionBuild(subject: subject, reverse: reverse).build
    
    switch self {
      case .Be(let ex):
        return build(ex(), { subject == ex() }, "equal \(ex())")

      case .Equal(let ex):
        return build(ex(), { subject == ex() }, "equal \(ex())")

      case .BeNil:
        return build(nil, { subject == nil }, "be nil")
    }
  }
}

public class ScalarExpectation<T:Equatable> : BaseExpectation {
  var subject: T?
  
  public init(subject: T?, cursor: Cursor = nullCursor) {
    self.subject = subject
    super.init(cursor: cursor)
  }
  
  public func to(matcher: EquatableMatcher<T>) {
    _assert(matcher.assertion(subject))
  }
  
  public func notTo(matcher: EquatableMatcher<T>) {
    _assert(matcher.assertion(subject, reverse: true))
  }
}

public func expect<T:Equatable>(subject: T?, file: String = __FILE__, line: Int = __LINE__) -> ScalarExpectation<T> {
  return Swiftest.context.currentExample().addExpectation(
    ScalarExpectation(subject: subject, cursor: Cursor(file: file, line: line))
  )
}