import Swiftest

class FailingSpec : SwiftestSuite {
  let spec = describe("failure") {

    it("passing example to better illustrate formatting") {
      expect(true).not().toBe(false)
    }
    
    it("asplodes") {
      expect(true).toBe(false)
    }
  }
}