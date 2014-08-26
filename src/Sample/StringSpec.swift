import Swiftest

class StringSpec : SwiftestSuite {
  let spec = describe("string assertions") {
    it("equals another string") {
      expect("abcdefg").to(.Equal("abcdefg"))
    }
    
    it("does not equal another string") {
      expect("abcdefg").notTo(.Equal("hijkl"))
    }

    it("ends with another string") {
      expect("abcdefg").to(.EndWith("efg"))
    }

    it("starts with another string") {
      expect("abcdefg").to(.StartWith("abc"))
    }

    it("contains another string") {
      expect("abcdefg").to(.Contain("bcdef"))
    }

    it("is greater than another string") {
      expect("def").to(.BeGreaterThan("abc"))
    }

    it("is less than another string") {
      expect("def").to(.BeLessThan("jkl"))
    }

    it("can be nil") {
      var str : String?
      expect(str).to(.BeNil)
    }
  }
}
