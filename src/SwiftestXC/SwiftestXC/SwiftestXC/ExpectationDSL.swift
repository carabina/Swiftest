import SwiftestCore

private func __add<T:Expectation>(ex: T) -> T {
  return Context.currentExample.addExpectation(ex)
}

public func expect<T:Equatable>(
  subject: [T],
  file: String = __FILE__,
  line: Int = __LINE__
) -> ArrayExpectation<T> {
  return __add(
    ArrayExpectation(subject: subject, cursor: Cursor(file: file, line: line))
  )
}

public func expect<K:Hashable,V:Equatable>(
  subject: Dictionary<K,V>,
  file: String = __FILE__,
  line: Int = __LINE__
) -> DictionaryExpectation<K,V> {
  return __add(
    DictionaryExpectation(subject: subject, cursor: Cursor(file: file, line: line))
  )
}

public func expect<T:Comparable>(
  subject: T?,
  file: String = __FILE__,
  line: Int = __LINE__
) -> ScalarComparison<T> {
  return __add(
    ScalarComparison(subject: subject, cursor: Cursor(file: file, line: line))
  )
}

public func expect<T:Equatable>(
  subject: T?,
  file: String = __FILE__,
  line: Int = __LINE__
) -> ScalarExpectation<T> {
  return __add(
    ScalarExpectation(subject: subject, cursor: Cursor(file: file, line: line))
  )
}

public func expect(
  subject: String?,
  file: String = __FILE__,
  line: Int = __LINE__
) -> StringExpectation {
  return __add(
    StringExpectation(subject: subject, cursor: Cursor(file: file, line: line))
  )
}

public func expect(
  fn: VoidBlk,
  file: String = __FILE__,
  line: Int = __LINE__
) -> VoidExpectation {
  return __add(
    VoidExpectation(subject: fn, cursor: Cursor(file: file, line: line))
  )
}