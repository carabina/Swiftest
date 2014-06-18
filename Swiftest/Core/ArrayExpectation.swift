extension Swiftest {
  class ArrayExpectation<T:Comparable> : BaseExpectation {
    typealias List = T[]
    var subject : List[]
    
    init(subject : List) {
      self.subject = [subject]
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
}
