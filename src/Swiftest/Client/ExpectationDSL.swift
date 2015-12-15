private func __add<T:Expectable>(ex: T) -> T {
  Context.currentExample.addExpectation(ex.result)
  return ex
}

public func expect<T:Equatable>(
  subject: [T]?,
  file: String = __FILE__,
  line: UInt = __LINE__
) -> ArrayExpectation<T> {
  return __add(
    ArrayExpectation(subject: subject, cursor: Cursor(file: file, line: line))
  )
}

public func expect<K:Hashable,V:Equatable>(
  subject: [K:V],
  file: String = __FILE__,
  line: UInt = __LINE__
) -> DictionaryExpectation<K, V> {
  return __add(
    DictionaryExpectation(subject: subject, cursor: Cursor(file: file, line: line))
  )
}

public func expect<T:Equatable>(
  subject: T?,
  file: String = __FILE__,
  line: UInt = __LINE__
) -> Expectation<T, EquatableMatcher<T>> {
  return __add(
    Expectation(subject: subject, cursor: Cursor(file: file, line: line))
  )
}

public func expect<T:Comparable>(
  subject: T?,
  file: String = __FILE__,
  line: UInt = __LINE__
) -> Expectation<T, ComparableMatcher<T>> {
  return __add(
    Expectation(subject: subject, cursor: Cursor(file: file, line: line))
  )
}

public func expect(
  file: String = __FILE__,
  line: UInt = __LINE__,
  subject: Void throws -> Void
) -> Expectation<Void throws -> Void, ThrowableVoidMatcher> {
  return __add(
    Expectation(subject: subject, cursor: Cursor(file: file, line: line))
  )
}

public func expect(
  file: String = __FILE__,
  line: UInt = __LINE__,
  subject: VoidBlk?
) -> Expectation<VoidBlk, VoidMatcher> {
  return __add(
    Expectation(subject: subject, cursor: Cursor(file: file, line: line))
  )
}

public func expect(
  subject: String?,
  file: String = __FILE__,
  line: UInt   = __LINE__
) -> Expectation<String, StringMatcher> {
  return __add(
    Expectation(subject: subject, cursor: Cursor(file: file, line: line))
  )
}
