class ArrayExpectation<T:Comparable> : BaseExpectation {
  typealias List = T[]
  var subject : List[]

  init(subject : List, file:String = __FILE__, line:Int = __LINE__) {
    self.subject = [subject]
    super.init()
    self.cursor = Cursor(file: file, line: line)
  }

  func not() -> ArrayExpectation {
    self._reverse = !_reverse
    return self
  }

  func toEqual(expected : List) {
    _assert(
      _subject() == expected,
      msg: "expected <\(_subject())> to\(_includeNot()) equal <\(expected)>"
    )
  }

  func toContain(expected : T) {
    _assert(
      _subject().filter({ el in el == expected }).count > 0,
      msg: "expected <\(_subject())>\(_includeNot()) to contain <\(expected)>"
    )
  }

  func _subject() -> List {
    return subject[0]
  }
}
