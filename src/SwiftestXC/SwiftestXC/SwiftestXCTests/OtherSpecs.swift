import SwiftestXC

class OtherSpec : SwiftestSpec {
  let spec = describe("another thing") {
    it("passes") { XCTAssert(true, "yay") }
  }
}