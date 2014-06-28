enum ExampleStatus : String, Comparable {
  case Fail    = "Fail"
  case Pass    = "Pass"
  case Pending = "Pending"
}

@infix func == (p1: ExampleStatus, p2: ExampleStatus) -> Bool {
  return p1.toRaw() == p2.toRaw()
}

@infix func < (p1: ExampleStatus, p2: ExampleStatus) -> Bool {
  return p1.toRaw() < p2.toRaw()
}

@infix func >= (p1: ExampleStatus, p2: ExampleStatus) -> Bool {
  return p1.toRaw() >= p2.toRaw()
}

@infix func <= (p1: ExampleStatus, p2: ExampleStatus) -> Bool {
  return p1.toRaw() <= p2.toRaw()
}
