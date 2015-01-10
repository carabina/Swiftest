public enum StringMatcher {
  case EndWith(@autoclosure () -> String)
  case StartWith(@autoclosure () -> String)
  case Contain(@autoclosure () -> String)
  case BeEmpty
  
  func assertion(subject: String?, reverse: Bool = false) -> Assertion {
    let build = BasicAssertion.build(subject, reverse: reverse)

    switch self {
    case .EndWith(let str):
      return build(fn: { subject?.hasSuffix(str()) ?? false }, msg: "end with \(str())")
      
    case .StartWith(let str):
      return build(fn: { subject?.hasPrefix(str()) ?? false }, msg: "start with \(str())")

    case .Contain(let str):
      return build(
        fn: {
          if let range = subject?.rangeOfString(str()) { return !range.isEmpty }
          return false
        },
        msg: "contain \(str())"
      )
      
    case .BeEmpty:
      return build(fn: { subject?.isEmpty ?? false }, msg: "be empty")
    }
  }
}