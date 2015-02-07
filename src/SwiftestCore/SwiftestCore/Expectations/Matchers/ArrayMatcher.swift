public enum ArrayMatcher<T:Equatable> {
  case Equal(@autoclosure () -> [T])
  case Contain(@autoclosure () -> T)
  case ContainEach(@autoclosure () -> [T])
  case BeEmpty
  
  func assertion(subject: [T], reverse: Bool = false) -> BasicAssertion<T> {
    let build = BasicAssertion.arrayBuild(subject, reverse: reverse)
    
    switch self {
    case .BeEmpty:
      return build(fn: { subject.isEmpty }, msg: "be empty")
      
    case .Equal(let ex):
      return build(fn: { subject == ex() }, msg: "equal \(ex())")
      
    case .Contain(let ex):
      return build(fn: {
        !subject.filter({ $0 == ex() }).isEmpty
      }, msg: "contain \(ex())")
      
    case .ContainEach(let ex):
      let expected = ex()
      return build(fn: {
        subject.filter({
          el in !expected.filter({ $0 == el }).isEmpty
        }).count == expected.count
      }, msg: "contain each of \(ex())")
    }
  }
}
