import Swiftest

class DictionarySpec : SwiftestSuite {
  let spec = describe("dictionaries") {
    let dict = [ "key" : "val" ]

    it("equals another dictionary") {
      expect(dict).to(.Equal([ "key" : "val" ]))
    }
    
    it("does not equal another dictionary") {
      expect(dict).notTo(.Equal([ "another-key" : "val"]))
    }
    
    it("has a given key") {
      expect(dict).to(.HaveKey("key"))
    }
    
    it("does not have a given key") {
      expect(dict).notTo(.HaveKey("another-key"))
    }

    it("has a given value") {
      expect(dict).to(.HaveValue("val"))
    }
    
    it("does not have a given value") {
      expect(dict).notTo(.HaveValue("another-val"))
    }

    it("contains a pair") {
      expect(dict).to(.Contain(["key" : "val"]))
    }
    
    it("does not contain a pair") {
      expect(dict).notTo(.Contain(["different-key" : "val"]))
    }
    
    it("is empty") {
      let emptyDict: Dictionary<String, String> = [ : ]
      expect(emptyDict).to(.BeEmpty)
    }
    
    it("is not empty") {
      expect(dict).notTo(.BeEmpty)
    }
  }
}
