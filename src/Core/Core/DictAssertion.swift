struct DictAssertion<K:Hashable, V> : Assertion {
  let call: Void -> Bool
  let reverse: Bool
  let msg: String

  static func build(
    subject: [K: V]?,
    reverse: Bool
  )(fn: Void -> Bool, msg: String) -> DictAssertion {
    let verb = reverse ? "to" : "not to"

    return DictAssertion(
      call: fn,
      reverse: reverse,
      msg: "expected \(subject) \(verb) \(msg)"
    )
  }
}
