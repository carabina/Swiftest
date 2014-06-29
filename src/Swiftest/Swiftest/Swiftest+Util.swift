extension Swiftest {
  struct Util {
    static let nullExample = Example(subject : "null example", fn: nullFn)
    static let nullSpec = Specification(subject: "null spec")
    static let nullFn: VoidBlk = {}
  }
}