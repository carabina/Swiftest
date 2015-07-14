public let nullSpec = Specification(subject: "null")
let nullCursor = Cursor(file: "null", line: 0)
public let nullExample = Example(subject: "null", fn: {})

public typealias VoidBlk = (Void -> Void)

public struct Swiftest {
  public static var reporter = Reporter()
}
