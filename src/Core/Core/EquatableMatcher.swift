public enum EquatableMatcher<T:Equatable> {
  case Be(@autoclosure () -> T?)
  case Equal(@autoclosure () -> T?)
  case BeNil
  
  func assertion(subject: T?, reverse: Bool = false) -> BasicAssertion<T> {
    let build = BasicAssertion.build(subject, reverse: reverse)
    
    switch self {
    case .Be(let ex):    return build(fn: { subject == ex() }, msg: "equal \(ex())")
    case .Equal(let ex): return build(fn: { subject == ex() }, msg: "equal \(ex())")
    case .BeNil:         return build(fn: { subject == nil  }, msg: "be nil")
    }
  }
}