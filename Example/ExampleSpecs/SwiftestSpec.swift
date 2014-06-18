import Swiftest

class SwiftestSpec : SwiftestSuite {
  var spec = describe("Swiftest") {
    it("adds 1 + 1!") {
      expect(1 + 1).toEqual(2)
    }
    
    it("knows true from false!") {
      expect(true).toBeTrue()
      expect(true).not().toBeFalse()
    }
    
    example("comparing letters of the alphabet!") {
      expect("abc").toEqual("abc")
    }
    
    it("knows what stuff is NOT other stuff!") {
      expect(2 + 2).not().toEqual(5)
    }
    
    example("arrays!") {
      expect([1, 2, 3]).toEqual([1, 2, 3])
      expect([1, 2, 3]).toContain(1)
    }
    
    example("dictionaries!") {
      expect([ "key" : "val" ]).toEqual([ "key" : "val"])
      expect([ "key" : "val" ]).toHaveKey("key")
      expect([ "key" : "val" ]).toHaveValue("val")
      expect([ "key" : "val", "key2" : "val2"]).toContain([ "key2" : "val2"])
    }
  }
}