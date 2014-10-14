import SwiftestXC

class HooksSpec: SwiftestSpec {
  let spec = describe("hooks") {
    var value : Bool?
    
    before() { value = true }
    
    it("sets the value before each example") {
      XCTAssert(value!, "the value should be true")
    }
    
    describe("nested hooks") {
      before() { value = false }
      
      it("sets the value using the most recent block") {
        XCTAssert(value == false, "the value is REALLY false")
      }
    }
    
    it("goes back to using only the blocks in the current scope") {
      XCTAssert(value == true, "the value is back to true")
    }
  }
}