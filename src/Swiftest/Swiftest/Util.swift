struct Util {
  static let nullExample = Example(subject : "null example", fn: nullFn)
  static let nullSpec = Specification(subject: "null spec")
  static let nullFn: VoidBlk = {}
  static let nullCursor = Cursor(file: "null", line: 0)

  static func hasStatus(status: ExampleStatus) -> (Runnable -> Bool) {
    return { obj in obj.getStatus() == status }
  }

  static func hasStatus(status: ExampleStatus) -> (BaseExpectation -> Bool) {
    return { spec in spec.getStatus() == status }
  }

  static func sortRunnables() -> (Runnable, Runnable) -> Bool {
    return { (r1, r2) in r1.ofType < r2.ofType }
  }
}
