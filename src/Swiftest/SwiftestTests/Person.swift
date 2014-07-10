extension SwiftestTests {
  class Person : Equatable {
    var name : String

    init(name : String) {
      self.name = name
    }
  }
}

@infix func ==(p1:SwiftestTests.Person, p2:SwiftestTests.Person) -> Bool {
  return p1.name == p2.name
}