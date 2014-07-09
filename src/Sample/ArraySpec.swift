import Swiftest

class ArraySpec : SwiftestSuite {
  let spec = describe("array assertions") {
    it("contains an element") {
      expect([1, 2, 3]).toContain(1)
    }

    it("contains many elements") {
      expect([1, 2, 3]).toContain(1, 2)
    }

    it("equals another array") {
      expect([1, 2, 3]).toEqual([1, 2, 3])
    }
  }
}