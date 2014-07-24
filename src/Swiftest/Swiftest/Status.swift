public enum Status : Equatable {
  case Fail
  case Pass
  case Pending

  public static func has(status: Status) -> (Runnable -> Bool) {
    return { obj in obj.getStatus() == status }
  }

  public static func has(status: Status) -> (BaseExpectation -> Bool) {
    return { spec in spec.getStatus() == status }
  }
}