import Swiftest

class StringSpec : SwiftestSuite {
  let spec = describe("string assertions") {
    it("equals another string") {
      expect("abcdefg").to(.Equal("abcdefg"))
    }
    
    it("does not equal another string") {
      expect("abc").notTo(.Equal("def"))
    }

    it("ends with another string") {
      expect("abcdefg").to(.EndWith("efg"))
    }
    
    it("does not end with another string") {
      expect("abcdefg").notTo(.EndWith("xyz"))
    }

    it("starts with another string") {
      expect("abcdefg").to(.StartWith("abc"))
    }
    
    it("does not start with another string") {
      expect("abcdefg").notTo(.StartWith("xyz"))
    }
    
    it("is an empty string") {
      let str = ""
      expect(str).to(.BeEmpty)
    }
    
    it("is not an empty string") {
      expect("abc").notTo(.BeEmpty)
    }

    describe("toContain") {
      it("contains another string") {
        expect("abcdefg").to(.Contain("bcdef"))
      }
      
      it("does not contain another string") {
        expect("abcdefg").notTo(.Contain("xyz"))
      }
      
      it("fails properly when the subject string is not present") {
        var emptyStr : String?
        expect(emptyStr).notTo(.Contain("abc"))
      }
    }
    
    it("is greater than another string") {
      expect("def").to(.BeGreaterThan("abc"))
    }

    it("is less than another string") {
      expect("def").to(.BeLessThan("jkl"))
    }

    it("is a nil String") {
      var str : String?
      expect(str).to(.BeNil)
    }
    
    it("is not a nil string") {
      var str : String? = "abc"
      expect(str).notTo(.BeNil)
    }
  }
}
