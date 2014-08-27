public enum ComparableMatcher<T:Comparable> {
  case Equal(@autoclosure () -> T?)
  case BeGreaterThan(@autoclosure () -> T?)
  case BeLessThan(@autoclosure () -> T?)
  case BeGreaterThanOrEqual(@autoclosure () -> T?)
  case BeLessThanOrEqual(@autoclosure () -> T?)
  case BeBetween(@autoclosure () -> T?, @autoclosure () -> T?)
  
  func assertion(subject: T?, reverse: Bool = false) -> BasicAssertion<T> {
    let build = AssertionBuild(subject: subject, reverse: reverse).build
    switch self {

    case .Equal(let ex):
      return build(ex(), { subject == ex() }, "equal \(ex())")

    case .BeGreaterThan(let ex):
      return build(ex(), { subject > ex() }, "be greater than \(ex())")

    case .BeLessThan(let ex):
      return build(ex(), { subject < ex() }, "be less than \(ex())")

    case .BeGreaterThanOrEqual(let ex):
      return build(ex(), { subject >= ex() }, "be greater than \(ex())")

    case .BeLessThanOrEqual(let ex):
      return build(ex(), { subject <= ex() }, "be less than or equal \(ex())")

    case .BeBetween(let lower, let upper):
      return build(lower(), { subject > lower() && subject < upper() }, "be between \(upper()) \(lower())")

    }
  }
}

public class ScalarComparison<T:Comparable> : BaseExpectation {
  public var subject: T?

  public init(subject: T?, cursor: Cursor = nullCursor) {
    self.subject = subject
    super.init(cursor: cursor)
  }
  
  public func to(matcher: ComparableMatcher<T>) {
    _assert(matcher.assertion(subject))
  }
  
  public func notTo(matcher: ComparableMatcher<T>) {
    _assert(matcher.assertion(subject, reverse: true))
  }
}

public func expect<T:Comparable>(subject: T?, file: String = __FILE__, line: Int = __LINE__) -> ScalarComparison<T> {
  return Swiftest.context.currentExample().addExpectation(
    ScalarComparison(subject: subject, cursor: Cursor(file: file, line: line))
  )
}

