import SwiftestClient

describe("string assertions") {
  it("equals another string") {
    expect("abcdefg").to.equal("abcdefg")
  }

  it("does not equal another string") {
    expect("abc").notTo.equal("def")
  }

  it("ends with another string") {
    expect("abcdefg").to.endWith("efg")
  }

  it("does not end with another string") {
    expect("abcdefg").notTo.endWith("xyz")
  }

  it("starts with another string") {
    expect("abcdefg").to.startWith("abc")
  }

  it("does not start with another string") {
    expect("abcdefg").notTo.startWith("xyz")
  }

  it("is an empty string") {
    let str = ""
    expect(str).to.beEmpty()
  }

  it("is not an empty string") {
    expect("abc").notTo.beEmpty()
  }

  describe("toContain") {
    it("contains another string") {
      expect("abcdefg").to.contain("bcdef")
    }

    it("does not contain another string") {
      expect("abcdefg").notTo.contain("xyz")
    }

    it("handles properly when the subject string is not present") {
      var emptyStr : String?
      expect(emptyStr).notTo.contain("abc")
    }
  }

  it("is greater than another string") {
    expect("def").to.beGreaterThan("abc")
  }

  it("is less than another string") {
    expect("def").to.beLessThan("jkl")
  }

  it("is a nil String") {
    var str : String?
    expect(str).to.beNil()
  }

  it("is not a nil string") {
    var str : String? = "abc"
    expect(str).notTo.beNil()
  }
}
