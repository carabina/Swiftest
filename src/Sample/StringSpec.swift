import Swiftest

class StringSpec : SwiftestSuite {
  let spec = describe("string assertions") {
    it("equals another string") {
      expect("abcdefg").toEqual("abcdefg")
    }
    
    it("does not equal another string") {
      expect("abcdefg").not().toEqual("hijkl")
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

    it("is greater than another string") {
      expect("def").toBeGreaterThan("abc")
    }

    it("is less than another string") {
      expect("def").toBeLessThan("jkl")
    }

    it("can be nil") {
      var str : String?
      expect(str).toBeNil()
    }
  }
}
