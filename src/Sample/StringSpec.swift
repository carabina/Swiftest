import Swiftest

class StringSpec : SwiftestSuite {
  let spec = describe("string assertions") {
    it("equals another string") {
      expect("abcdefg").toEqual("abcdefg")
    }

    it("ends with another string") {
      expect("abcdefg").toEndWith("efg")
    }

    it("starts with another string") {
      expect("abcdefg").toStartWith("abc")
    }

    it("contains another string") {
      expect("abcdefg").toContain("bcdef")
    }
  }
}