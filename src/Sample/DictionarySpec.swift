import Swiftest

class DictionarySpec : SwiftestSuite {
  let spec = describe("dictionary assertions") {
    let dict = [ "key" : "val" ]

    it("equals") {
      expect(dict).toEqual([ "key" : "val" ])
    }

    it("has a given key") {
      expect(dict).toHaveKey("key")
    }

    it("has a given value") {
      expect(dict).toHaveValue("val")
    }

    it("has a pair") {
      expect(dict).toContain(["key" : "val"])
    }
  }
}
