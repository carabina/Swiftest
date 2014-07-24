public struct Cursor {
  var file: String
  var line: Int

  func relativePath() -> String {
    var origin = __FILE__.componentsSeparatedByString("/")
    return file.componentsSeparatedByString("/")
      .filter({ s in origin.filter({ o in o == s}).isEmpty })
      .reduce("") { (let acc, s) in
        return "\(acc)/\(s)"
      }
      .substringFromIndex(1)

  }
}
