import SwiftestCore

class XCListener : Listener {
  override init() { super.init() }
  
  override func finished(ex: Example) {
    let isFailing = Status.equals(.Fail)
    
    for failure in ex.expectations.filter({ isFailing($0) }) {
      XCTFail(
        failure.msg,
        file: failure.cursor.file,
        line: UInt(failure.cursor.line)
      )
    }
  }
}
