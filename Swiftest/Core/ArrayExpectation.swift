class ArrayExpectation<T:Comparable> : BaseExpectation {
  typealias List = T[]
  var actual : List[]

  init(actual : List) {
    self.actual = [actual]
  }

  func not() -> ArrayExpectation {
    self._reverse = !_reverse
    return self
  }

  func toEqual(expected : List) {
    _assert(_subject() == expected)
  }

  func toContain(expected : T) {
    _assert(_subject().filter({ el in el == expected }).count > 0)
  }

  func _subject() -> List {
    return actual[0]
  }
}
