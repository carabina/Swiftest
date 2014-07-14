enum Status : Equatable {
  case Fail
  case Pass
  case Pending

  static func has(status: Status) -> (Runnable -> Bool) {
    return { obj in obj.getStatus() == status }
  }

  static func has(status: Status) -> (BaseExpectation -> Bool) {
    return { spec in spec.getStatus() == status }
  }
}