public class VoidPredicate<T:Equatable> {
  var originalValue : T
  let predicate : Void -> T
  let subject: VoidBlk
  let parent: VoidExpectation

  public init(predicate: Void -> T, subject: VoidBlk, parent: VoidExpectation) {
    self.subject = subject
    self.predicate = predicate
    self.originalValue = predicate()
    self.parent = parent
  }

  public func from(expected: T) -> VoidPredicate {
    _assert(
      originalValue == expected,
      msg: "expected an original value of \(expected), but was \(originalValue)"
    )

    return self
  }

  public func to(expected: T) {
    subject()
    _assert(
      predicate() == expected,
      msg: "expected \(originalValue) to change to \(expected), " +
      "changed to \(predicate())"
    )
  }

  public func by(delta: Int) {
    if let oldVal = originalValue as? Int {
      subject()
      _assert(
        predicate() as Int == oldVal + delta,
        msg: "expected change (by \(delta)) from \(originalValue) to " +
        "\(oldVal + delta), changed to \(predicate())"
      )
    } else {
      _assert(false, msg: "couldn't compare \(predicate().dynamicType)")
    }
  }

  public func _assert(cond: Bool, msg: String) {
    parent._assert(cond, msg: msg)
  }
}
