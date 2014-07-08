extension Example {
  func expect<T:Comparable>(
    subject: T,
    cursor: Cursor = Util.nullCursor
  ) -> ScalarExpectation<T> {
    return _addExpectation(ScalarExpectation(subject: subject, cursor: cursor))
  }

  func expect<T:Comparable>(
    subject: [T],
    cursor: Cursor = Util.nullCursor
  ) -> ArrayExpectation<T> {
    return _addExpectation(ArrayExpectation(subject: subject, cursor: cursor))
  }

  func expect<K:Comparable, V:Comparable>(
    subject: Dictionary<K, V>,
    cursor: Cursor = Util.nullCursor
  ) -> DictionaryExpectation<K, V> {
    return _addExpectation(
      DictionaryExpectation(subject: subject, cursor: cursor)
    )
  }

  func expect(subj: Bool, cursor: Cursor = Util.nullCursor) -> BoolExpectation {
    return _addExpectation(BoolExpectation(subject: subj, cursor: cursor))
  }

  func expect(fn: VoidBlk, cursor:Cursor = Util.nullCursor) -> VoidExpectation {
    return _addExpectation(VoidExpectation(subject: fn, cursor: cursor))
  }

  func _addExpectation<T:BaseExpectation>(exp: T) -> T {
    exp.example = self
    expectations.append(exp)
    return exp
  }
}