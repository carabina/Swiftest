enum Status : String, Comparable {
  case Fail    = "Fail"
  case Pass    = "Pass"
  case Pending = "Pending"

  static func has(status: Status) -> (Runnable -> Bool) {
    return { obj in obj.getStatus() == status }
  }
  
  static func has(status: Status) -> (BaseExpectation -> Bool) {
    return { spec in spec.getStatus() == status }
  }
}

@infix func == (p1: Status, p2: Status) -> Bool {
  return p1.toRaw() == p2.toRaw()
}

@infix func < (p1: Status, p2: Status) -> Bool {
  return p1.toRaw() < p2.toRaw()
}

@infix func >= (p1: Status, p2: Status) -> Bool {
  return p1.toRaw() >= p2.toRaw()
}

@infix func <= (p1: Status, p2: Status) -> Bool {
  return p1.toRaw() <= p2.toRaw()
}
