public struct BasicAssertion<T> : Assertion {
  public let call: Void -> Bool
  public let reverse: Bool
  public let msg: String

  public static func build(
    subject: T?,
    reverse: Bool
  )(fn: Void -> Bool, msg: String) -> BasicAssertion {
    let verb = reverse ? "not to" : "to"

    return BasicAssertion(
      call: fn,
      reverse: reverse,
      msg: "expected \(subject) \(verb) \(msg)"
    )
  }
  
  public static func arrayBuild(
    subject: [T]?,
    reverse: Bool
  )(fn: Void -> Bool, msg: String) -> BasicAssertion {
    let verb = reverse ? "not to" : "to"
    
    return BasicAssertion(
      call: fn,
      reverse: reverse,
      msg: "expected \(subject) \(verb) \(msg)"
    )
  }
}