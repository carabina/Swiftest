public struct Cursor {
  public var file: String
  public var line: UInt

  public init(file: String, line: UInt) {
    (self.file, self.line) = (file, line)
  }
}