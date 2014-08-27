public enum StringMatcher {

  case EndWith(@autoclosure () -> String)
  case StartWith(@autoclosure () -> String)
  case Contain(@autoclosure () -> String)
  case BeEmpty

  func assertion(subject: String?, reverse: Bool = false) -> BasicAssertion<String> {
    let build = AssertionBuild(subject: subject, reverse: reverse).build
    
    switch self {
    case .EndWith(let ex):
      return build(ex(), { subject!.hasSuffix(ex()) }, "end with \(ex())")
      
    case .StartWith(let ex):
      return build(ex(), { subject!.hasPrefix(ex()) }, "start with \(ex())")

    case .Contain(let ex):
      let findStr : Void -> Bool = {
        if let range = subject?.rangeOfString(ex()) { return !range.isEmpty }
        return false;
      }
      
      return build(ex(), findStr, "contain \(ex())")
    
    case .BeEmpty:
      let checkEmpty : Void -> Bool = {
        if let s = subject? { return s.isEmpty }
        return false
      }
      
      return build(nil, checkEmpty, "be empty")
    }
  }
}

public class StringExpectation<T> : ScalarComparison<String> {
  public override init(subject: String?, cursor: Cursor = nullCursor) {
    super.init(subject: subject, cursor: cursor)
  }
  
   public func to(matcher: StringMatcher) {
    _assert(matcher.assertion(subject))
  }
  
  public func notTo(matcher: StringMatcher) {
    _assert(matcher.assertion(subject, reverse: true))
  }
}

public func expect(
  subject: String?,
  file:String = __FILE__,
  line:Int = __LINE__
) -> StringExpectation<String> {
  return Swiftest.context.currentExample().addExpectation(
    StringExpectation(subject: subject, cursor: Cursor(file: file, line: line))
  )
}
