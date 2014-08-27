public enum ArrayMatcher<T:Equatable> {
  case Equal(@autoclosure () -> [T])
  case Contain(@autoclosure () -> T)
  case ContainEach(@autoclosure () -> [T])
  case BeEmpty

  func assertion(subject: [T], reverse: Bool = false) -> BasicAssertion<T> {
    let build = ArrayAssertionBuild(subject: subject, reverse: reverse).build

    switch self {
    case BeEmpty:
      return build(nil, { subject.isEmpty }, "be empty")

    case .Equal(let ex):
      return build(ex(), { subject == ex() }, "equal \(ex())")

    case .Contain(let ex):
      let containFn : Void -> Bool = {
        !subject.filter() { s in s == ex() }.isEmpty
      }

      return build([ex()], containFn, "contain \(ex())")

    case ContainEach(let ex):
      let containFn : Void -> Bool = {
        subject.filter() { (let subjectEl) in
          !ex().filter({ el in el == subjectEl }).isEmpty
        }.count == ex().count
      }

      return build(ex(), containFn, "contain each of \(ex())")
    }
  }
}

public class ArrayExpectation<T:Equatable> : BaseExpectation {
  typealias List = [T]
  var subject : List

  public init(subject: List, cursor: Cursor = nullCursor) {
    self.subject = subject
    super.init(cursor: cursor)
  }

  public func to(matcher: ArrayMatcher<T>) {
    _assert(matcher.assertion(subject))
  }

  public func notTo(matcher: ArrayMatcher<T>) {
    _assert(matcher.assertion(subject, reverse: true))
  }
}

public func expect<T:Equatable>(
  subject: [T],
  file: String = __FILE__,
  line: Int = __LINE__
) -> ArrayExpectation<T> {
  return Swiftest.context.currentExample().addExpectation(
    ArrayExpectation(subject: subject, cursor: Cursor(file: file, line: line))
  )
}

