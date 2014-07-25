import Swiftest

class StringSpec : SwiftestSuite {
  let spec = describe("string assertions") {
    it("equals another string") {
      expect("abcdefg").toEqual("abcdefg")
    }
    
    it("does not equal another string") {
      expect("abc").not().toEqual("def")
    }

    it("ends with another string") {
      expect("abcdefg").toEndWith("efg")
    }
    
    it("does not end with another string") {
      expect("abcdefg").not().toEndWith("xyz")
    }

    it("starts with another string") {
      expect("abcdefg").toStartWith("abc")
    }
    
    it("does not start with another string") {
      expect("abcdefg").not().toStartWith("xyz")
    }

    describe("toContain") {
      it("contains another string") {
        expect("abcdefg").toContain("bcdef")
      }
      
      it("does not contain another string") {
        expect("abcdefg").not().toContain("xyz")
      }
      
      it("fails properly when the subject string is not present") {
        var emptyStr : String?
        expect(emptyStr).not().toContain("abc")
      }
    }
    
    it("is greater than another string") {
      expect("def").toBeGreaterThan("abc")
    }

    it("is less than another string") {
      expect("def").toBeLessThan("jkl")
    }

    it("is a nil String") {
      var str : String?
      expect(str).toBeNil()
    }
    
    it("is not a nil string") {
      var str : String? = "abc"
      expect(str).not().toBeNil()
    }
  }
}
