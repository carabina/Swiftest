extension Swiftest {
  enum ExampleStatus : String, Comparable {
    case Pending = "Pending"
    case Pass    = "Pass"
    case Fail    = "Fail"
  }
}

@infix func ==(p1:Swiftest.ExampleStatus, p2:Swiftest.ExampleStatus) -> Bool {
  return p1.toRaw() == p2.toRaw()
}

@infix func < (p1:Swiftest.ExampleStatus, p2:Swiftest.ExampleStatus) -> Bool {
  return p1.toRaw() < p2.toRaw()
}

@infix func >= (p1:Swiftest.ExampleStatus, p2:Swiftest.ExampleStatus) -> Bool {
  return p1.toRaw() >= p2.toRaw()
}

@infix func <= (p1:Swiftest.ExampleStatus, p2:Swiftest.ExampleStatus) -> Bool {
  return p1.toRaw() <= p2.toRaw()
}