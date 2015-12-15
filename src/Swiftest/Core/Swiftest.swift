public let nullSpec = Specification(subject: "null")
let nullCursor = Cursor(file: "null", line: 0)
public let nullExample = Example(subject: "null", fn: {})
public var reporter = Reporter()

public typealias VoidBlk = (Void -> Void)
