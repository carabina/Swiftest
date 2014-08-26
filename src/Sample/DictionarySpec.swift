import Swiftest

class DictionarySpec : SwiftestSuite {
  let spec = describe("dictionary assertions") {
    let dict = [ "key" : "val" ]

    it("equals") {
      expect(dict).to(.Equal([ "key" : "val" ]))
    }

    it("has a given key") {
      expect(dict).to(.HaveKey("key"))
    }

    it("has a given value") {
      expect(dict).to(.HaveValue("val"))
    }

    it("has a pair") {
      expect(dict).to(.Contain(["key" : "val"]))
    }
  }
}
