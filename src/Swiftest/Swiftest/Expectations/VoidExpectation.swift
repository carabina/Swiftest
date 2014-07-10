class VoidExpectation : BaseExpectation {
  var subject: VoidBlk
  var assertions : [Bool] = []

  init(subject: VoidBlk, cursor: Cursor = nullCursor) {
    self.subject = subject
    super.init()
    self.cursor = cursor
  }

  func toChange<T:Comparable>(predicate: Void -> T) -> VoidPredicate<T> {
    return VoidPredicate(predicate: predicate, subject: subject, parent: self)
  }

  override func getStatus() -> Status {
    return assertions.filter({ st in !st }).isEmpty ? .Pass : .Fail
  }

  override func _assert(cond: Bool, msg: String) {
    assertions.append(cond)
    if(self.msg == defaultMessage || !cond) {
      self.msg = msg
    }

    super._assert(cond)
  }
}

func expect(fn: VoidBlk, file: String = __FILE__, line: Int = __LINE__) -> VoidExpectation {
  return Swiftest.context.currentExample().addExpectation(
    VoidExpectation(subject: fn, cursor: Cursor(file: file, line: line))
  )
}

