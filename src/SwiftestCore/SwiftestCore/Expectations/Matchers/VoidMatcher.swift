public enum VoidMatcher<T:Comparable> {
  case Change(@autoclosure () -> T)
  
  func assertion(
    subject: VoidBlk,
    reverse: Bool,
    parent: VoidExpectation
  ) -> VoidPredicate<T> {
    switch self {
    case .Change(let t):
      return VoidPredicate(predicate: t, subject: subject, parent: parent)
    }
  }
}