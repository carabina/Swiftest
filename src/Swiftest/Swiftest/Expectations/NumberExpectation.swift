public class NumberExpectation<T:Comparable> : ScalarComparison<T> {
  
  override init(subject: T?, cursor: Cursor = nullCursor) {
    super.init(subject: subject, cursor: cursor)
  }
  
  override public func not() -> NumberExpectation {
    self._reverse = !_reverse
    return self
  }
  
  public func toBeBetween(start: T, _ end: T) {
    _assert(
      subject > start && subject < end,
      msg: "expected <\(subject)> to be between <\(start)> and <\(end)>"
    )
  }
}

public func expect(subject: Int?, file: String = __FILE__, line: Int = __LINE__) -> NumberExpectation<Int> {
  return Swiftest.context.currentExample().addExpectation(
    NumberExpectation(subject: subject, cursor: Cursor(file: file, line: line))
  )
}

public func expect(subject: Float?, file: String = __FILE__, line: Int = __LINE__) -> NumberExpectation<Float> {
  return Swiftest.context.currentExample().addExpectation(
    NumberExpectation(subject: subject, cursor: Cursor(file: file, line: line))
  )
}

public func expect(subject: Double?, file: String = __FILE__, line: Int = __LINE__) -> NumberExpectation<Double> {
  return Swiftest.context.currentExample().addExpectation(
    NumberExpectation(subject: subject, cursor: Cursor(file: file, line: line))
  )
}


