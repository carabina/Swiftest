protocol HasStatus {
  func status() -> Status
}

public enum Status {
  case Pending
  case Pass
  case Fail
  
  static func has(st: Status, within: [HasStatus]) -> Bool {
    return !within.filter(equals(st)).isEmpty
  }
  
  static func equals(one: Status)(two: HasStatus) -> Bool {
    return one == two.status()
  }
}