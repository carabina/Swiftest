import Swiftest

class NumberSpec : SwiftestSuite {
  let spec = describe("number expectations") {
    it("equals another number") {
      expect(42).to(.Equal(42))
      expect(42.0).to(.Equal(42))
      expect(42.0).to(.Equal(42.0))
    }
    
    it("does not equal another number") {
      expect(42).notTo(.Equal(43))
      expect(42.0).notTo(.Equal(43))
    }
    
    it("is greater than another number") {
      expect(42).to(.BeGreaterThan(1))
      expect(42.0).to(.BeGreaterThan(1.0))
    }
    
    it("is not greater than another number") {
      expect(42).notTo(.BeGreaterThan(43))
      expect(42.0).notTo(.BeGreaterThan(43.0))
    }
    
    it("is less than another number") {
      expect(42).to(.BeLessThan(100))
      expect(42.0).to(.BeLessThan(100.0))
    }
    
    it("is not less than another number") {
      expect(42).notTo(.BeLessThan(1))
      expect(42.0).notTo(.BeLessThan(1.0))
    }
    
    it("is greater than or equal to another number") {
      expect(42).to(.BeGreaterThanOrEqual(42))
      expect(42.0).to(.BeGreaterThanOrEqual(42.0))

      expect(42).to(.BeGreaterThanOrEqual(1))
      expect(42.0).to(.BeGreaterThanOrEqual(1.0))
    }
    
    it("is less than or equal to another number") {
      expect(42).to(.BeLessThanOrEqual(100))
      expect(42.0).to(.BeLessThanOrEqual(100.0))
 
      expect(42).to(.BeLessThanOrEqual(42))
      expect(42.0).to(.BeLessThanOrEqual(42.0))
    }
    
    it("is between two numbers") {
      expect(42).to(.BeBetween(41, 43))
      expect(42.0).to(.BeBetween(41.0, 43.0))
    }
    
    it("is not between two numbers") {
      expect(42).notTo(.BeBetween(43, 44))
    }
    
    it("is a nil number") {
      var a : Int?
      expect(a).to(.BeNil)
    }
    
    it("is not a nil number") {
      var a : Int? = 42
      expect(1).notTo(.BeNil)
    }
  }
}