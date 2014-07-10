import Swiftest

class FailingSpec : SwiftestSuite {
  let spec = describe("failure") {

    it("passing example to better illustrate formatting") {
      expect(true).not().toBe(false)
    }

    it("asplodes") {
      expect(true).toBe(false)
      expect(true).not().toBe(true)
    }

    it("formats failure nicely") {
      expect(1).toEqual(2)
    }
  }
}
