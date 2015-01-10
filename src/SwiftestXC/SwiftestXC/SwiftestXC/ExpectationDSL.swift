import SwiftestCore

public func expect<T:Equatable>(
  subject: [T],
  file: String = __FILE__,
  line: Int = __LINE__
) -> ArrayExpectation<T> {
  return Context.currentExample.addExpectation(
    ArrayExpectation(subject: subject, cursor: Cursor(file: file, line: line))
  )
}

public func expect<K:Hashable,V:Equatable>(
  subject: Dictionary<K,V>,
  file: String = __FILE__,
  line: Int = __LINE__
) -> DictionaryExpectation<K,V> {
  return Context.currentExample.addExpectation(
    DictionaryExpectation(subject: subject, cursor: Cursor(file: file, line: line))
  )
}

public func expect<T:Comparable>(
  subject: T?,
  file: String = __FILE__,
  line: Int = __LINE__
) -> ScalarComparison<T> {
  return Context.currentExample.addExpectation(
    ScalarComparison(subject: subject, cursor: Cursor(file: file, line: line))
  )
}

public func expect<T:Equatable>(
  subject: T?,
  file: String = __FILE__,
  line: Int = __LINE__
) -> ScalarExpectation<T> {
  return Context.currentExample.addExpectation(
    ScalarExpectation(subject: subject, cursor: Cursor(file: file, line: line))
  )
}

public func expect(
  subject: String,
  file: String = __FILE__,
  line: Int = __LINE__
) -> StringExpectation {
  return Context.currentExample.addExpectation(
    StringExpectation(subject: subject, cursor: Cursor(file: file, line: line))
  )
}

public func expect(
  fn: VoidBlk,
  file: String = __FILE__,
  line: Int = __LINE__
) -> VoidExpectation {
  return Context.currentExample.addExpectation(
    VoidExpectation(subject: fn, cursor: Cursor(file: file, line: line))
  )
}
