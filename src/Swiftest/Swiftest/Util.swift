struct Util {
  static let nullExample = Example(subject : "null example", fn: nullFn)
  static let nullSpec = Specification(subject: "null spec")
  static let nullFn: VoidBlk = {}
  static let nullCursor = Cursor(file: "null", line: 0)

  static func hasStatus(status: ExampleStatus) -> (Runnable -> Bool) {
    return { obj in obj.getStatus() == status }
  }
}
