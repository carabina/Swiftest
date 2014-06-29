import Swiftest
import Sample

class SwiftestSpec : SwiftestSuite {
  let spec = describe("Swiftest") {
    it("deals with Swift core data types") {
      expect(true).toBe(true)
      expect(true).not().toBe(false)

      expect(1).toEqual(1)
      expect(123).toBeLessThan(1234)

      expect("abc").toEqual("abc")
      expect("abc").not().toEqual("def")
    }

    describe("arrays") {
      it("has special array expectations") {
        expect([1, 2, 3]).toContain(2)
        expect([1, 2, 3]).toContain(1, 3)
        expect([1, 2]).toEqual([1, 2])
      }
    }

    it("has special dictionary expectations, too") {
      expect(["key" : "value"]).toHaveKey("key")
      expect(["key" : "value"]).toHaveValue("value")
      expect(["key" : "value"]).toContain(["key" : "value"])
    }

    it("can compare pure-swift classes that conform to Comparable") {
      let human1 = Human(name: "Fred")
      let human2 = Human(name: "Fred")
      let human3 = Human(name: "Not-Fred")

      expect(human1).toEqual(human2)
      expect(human1).not().toEqual(human3)
    }

    it("allows pending specs")
    
    xit("allows you to turn off a test") {
      expect(1).toEqual(2)
    }

    it("fails spectacularly!") {
      expect(true).toBe(false)
    }
  }
}
