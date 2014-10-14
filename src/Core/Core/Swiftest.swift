public let nullSpec = Specification(subject: "null") {}
let nullCursor = Cursor(file: "null", line: -1)
let nullExample = Example(subject: "null", fn: {})

public typealias VoidBlk = (Void -> Void)

public struct Swiftest {
  public static let reporter = Reporter()
  public static let timer = Timer()
}