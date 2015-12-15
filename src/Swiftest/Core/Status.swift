public protocol HasStatus {
  var status: Status { get }
}

public enum Status {
  case Pending
  case Pass
  case Fail

  public static func equals(one: Status) -> HasStatus -> Bool {
    return { two in return one == two.status }
  }
}
