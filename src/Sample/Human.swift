class Human : Equatable {
  var name : String

  init(name : String) { self.name = name }
}

@infix func ==(p1:Human, p2:Human) -> Bool {
  return p1.name == p2.name
}
