import Foundation

class XCListener : BaseListener {
  let printer = NSFileHandle.fileHandleWithStandardError()

  var messages:[String] = []

  override func expectationFailed(expectation: BaseExpectation) {
    messages.append(
      "\(expectation.cursor.file):\(expectation.cursor.line): error : \(expectation.msg)\n"
    )
  }

  override func suiteFinished() {
    for msg in messages {
      printer.writeData(msg.dataUsingEncoding(NSUTF8StringEncoding))
    }
  }
}
