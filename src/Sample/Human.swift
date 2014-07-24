public class Human : Equatable {
  public var name : String

  public init(name : String) { self.name = name }
}

@infix public func ==(p1:Human, p2:Human) -> Bool {
  return p1.name == p2.name
}
