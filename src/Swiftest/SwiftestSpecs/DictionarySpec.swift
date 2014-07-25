import Swiftest

class DictionarySpec : SwiftestSuite {
  let spec = describe("dictionaries") {
    let dict = [ "key" : "val" ]

    it("equals another dictionary") {
      expect(dict).toEqual([ "key" : "val" ])
    }
    
    it("does not equal another dictionary") {
      expect(dict).not().toEqual([ "another-key" : "val"])
    }
    
    it("has a given key") {
      expect(dict).toHaveKey("key")
    }
    
    it("does not have a given key") {
      expect(dict).not().toHaveKey("another-key")
    }

    it("has a given value") {
      expect(dict).toHaveValue("val")
    }
    
    it("does not have a given value") {
      expect(dict).not().toHaveValue("another-val")
    }

    it("contains a pair") {
      expect(dict).toContain(["key" : "val"])
    }
    
    it("does not contain a pair") {
      expect(dict).not().toContain(["different-key" : "val"])
    }
  }
}
