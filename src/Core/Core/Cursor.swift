public struct Cursor {
  public var file: String
  public var line: UInt
  
  public init(file: String, line: UInt) {
    self.file = file
    self.line = line
  }

  public func relativePath() -> String {
    var origin = __FILE__.componentsSeparatedByString("/")
    
    return file.componentsSeparatedByString("/")
      .filter({ s in origin.filter({ $0 == s}).isEmpty })
      .reduce("") { return "\($0)/\($1)" }
      .substringFromIndex(1)
  }
}