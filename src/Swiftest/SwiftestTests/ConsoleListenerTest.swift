import Swiftest
import XCTest

class ConsoleListenerTest : XCTestCase {

  let listener = ConsoleListener()
  var messages : [String] = []

  override func setUp() {
    listener.printer = { (let msg) in self.messages.append(msg) }
  }
}
