class VoidExpectation : BaseExpectation {
  var subject: VoidBlk

  init(subject: VoidBlk, cursor: Cursor = Util.nullCursor) {
    self.subject = subject
    super.init()
    self.cursor = cursor
  }

  func toChange<T:Comparable>(predicate: Void -> T) -> VoidPredicate<T> {
    return VoidPredicate(predicate: predicate, subject: subject, parent: self)
  }
}

class VoidPredicate<T:Comparable> {
  var originalValue : T[]
  let predicate : Void -> T
  let subject: VoidBlk
  let parent: VoidExpectation

  init(predicate: Void -> T, subject: VoidBlk, parent: VoidExpectation) {
    self.subject = subject
    self.predicate = predicate
    self.originalValue = [predicate()]
    self.parent = parent
  }

  func to(expected: T) {
    subject()
    _assert(
      predicate() == expected,
      msg: "expected \(_orig()) to change to \(expected), " +
        "changed to \(predicate())"
    )
  }

  func by(delta: Int) {
    if let oldVal = _orig() as? Int {
      subject()
      _assert(
        predicate() as Int == oldVal + delta,
        msg: "expected change (by \(delta)) from \(_orig()) to " +
          "\(oldVal + delta), changed to \(predicate())"
      )
    } else {
      _assert(false, msg: "couldn't compare \(predicate().dynamicType)")
    }
  }

  func _assert(cond:Bool, msg: String) {
    parent._assert(cond, msg:msg)
  }

  func _orig() -> T {
    return originalValue[0]
  }
}