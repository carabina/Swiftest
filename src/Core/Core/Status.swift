public protocol HasStatus {
  var status: Status { get }
}

public enum Status {
  case Pending
  case Pass
  case Fail
  
  public static func equals(one: Status)(two: HasStatus) -> Bool {
    return one == two.status
  }
  
  public static func has(st: Status, within: [HasStatus]) -> Bool {
    return !within.filter(equals(st)).isEmpty
  }
  
}
