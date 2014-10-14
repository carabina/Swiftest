public enum ComparableMatcher<T:Comparable> {
  typealias CompValue = @autoclosure () -> T?
  
  case Equal(CompValue)
  case BeGreaterThan(CompValue)
  case BeLessThan(CompValue)
  case BeGreaterThanOrEqual(CompValue)
  case BeLessThanOrEqual(CompValue)
  case BeBetween(CompValue, CompValue)
  
  func assertion(subject: T?, reverse: Bool = false) -> BasicAssertion<T> {
    let build = BasicAssertion.build(subject, reverse: reverse)
    
    switch self {
    case .Equal(let ex):
      return build(fn: { subject == ex() }, msg: "equal \(ex())")
      
    case .BeGreaterThan(let ex):
      return build(fn: { subject > ex() }, msg: "be greater than \(ex())")
      
    case .BeLessThan(let ex):
      return build(fn: { subject < ex() }, msg: "be less than \(ex())")
      
    case .BeGreaterThanOrEqual(let ex):
      return build(fn: { subject >= ex() }, msg: "be greater than \(ex())")
      
    case .BeLessThanOrEqual(let ex):
      return build(fn: { subject <= ex() }, msg: "be less than or equal \(ex())")
      
    case .BeBetween(let lower, let upper):
      return build(
        fn: { subject > lower() && subject < upper() },
        msg: "be between \(upper()) \(lower())"
      )
    }
  }
}