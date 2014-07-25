import Swiftest

class NumberSpec : SwiftestSuite {
  let spec = describe("number expectations") {
    it("equals another number") {
      expect(42).toEqual(42)
      expect(42.0).toEqual(42)
      expect(42.0).toEqual(42.0)
    }
    
    it("does not equal another number") {
      expect(42).not().toEqual(43)
      expect(42.0).not().toEqual(43)
    }
    
    it("is greater than another number") {
      expect(42).toBeGreaterThan(1)
      expect(42.0).toBeGreaterThan(1.0)
    }
    
    it("is not greater than another number") {
      expect(42).not().toBeGreaterThan(43)
      expect(42.0).not().toBeGreaterThan(43.0)
    }
    
    it("is less than another number") {
      expect(42).toBeLessThan(100)
      expect(42.0).toBeLessThan(100.0)
    }
    
    it("is not less than another number") {
      expect(42).not().toBeLessThan(1)
      expect(42.0).not().toBeLessThan(1.0)
    }
    
    it("is greater than or equal to another number") {
      expect(42).toBeGreaterThanOrEqualTo(1)
      expect(42.0).toBeGreaterThanOrEqualTo(1.0)

      expect(42).toBeGreaterThanOrEqualTo(42)
      expect(42.0).toBeGreaterThanOrEqualTo(42.0)
    }
    
    it("is less than or equal to another number") {
      expect(42).toBeLessThanOrEqualTo(100)
      expect(42.0).toBeLessThanOrEqualTo(100.0)
 
      expect(42).toBeLessThanOrEqualTo(42)
      expect(42.0).toBeLessThanOrEqualTo(42.0)
    }
    
    it("is between two numbers") {
      expect(42).toBeBetween(41, 43)
      expect(42.0).toBeBetween(41.0, 43.0)
    }
    
    it("is not between two numbers") {
      expect(42).not().toBeBetween(43, 44)
    }
    
    it("is a nil number") {
      var a : Int?
      expect(a).toBeNil()
    }
    
    it("is not a nil number") {
      var a : Int? = 42
      expect(1).not().toBeNil()
    }
  }
}