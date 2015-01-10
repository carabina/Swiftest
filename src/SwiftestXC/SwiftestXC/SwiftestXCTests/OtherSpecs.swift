import SwiftestXC

class OtherSpec : SwiftestSpec {
  let spec = describe("another thing") {
    it("passes") {
      expect(1).to(.Equal(1))
    }
  }
}