import Swiftest

class NumberSpec : SwiftestSuite {
  let spec = describe("number expectations") {
    it("equals another number") {
      expect(42).toEqual(42)
      expect(42.0).toEqual(42.0)
    }
    
    it("is greater than another number") {
      expect(42).toBeGreaterThan(1)
      expect(42.0).toBeGreaterThan(1.0)
    }
    
    it("is less than another number") {
      expect(42).toBeLessThan(100)
      expect(42.0).toBeLessThan(100.0)
    }
    
    it("is greater than or equal to another number") {
      expect(42).toBeGreaterThanOrEqualTo(1)
      expect(42.0).toBeGreaterThanOrEqualTo(1.0)
    }
    
    it("is less than or equal to another number") {
      expect(42).toBeLessThanOrEqualTo(100)
      expect(42.0).toBeLessThanOrEqualTo(100.0)
    }
    
    it("is between two numbers") {
      expect(42).toBeBetween(41, 43)
      expect(42.0).toBeBetween(41.0, 43.0)
    }
    
    it("is a nil number") {
      var a : Int?
      expect(a).toBeNil()
    }
  }
}