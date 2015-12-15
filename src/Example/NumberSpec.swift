import Swiftest

class NumberSpec: Swiftest.Spec {
  let spec = describe("number expectations") {
    it("equals another number") {
      expect(42).to.equal(42)
      expect(42.0).to.equal(42)
      expect(42.0).to.equal(42.0)
    }

    it("does not equal another number") {
      expect(42).notTo.equal(43)
      expect(42.0).notTo.equal(43)
    }

    it("is greater than another number") {
      expect(42).to.beGreaterThan(1)
      expect(42.0).to.beGreaterThan(1.0)
    }

    it("is not greater than another number") {
      expect(42).notTo.beGreaterThan(43)
      expect(42.0).notTo.beGreaterThan(43.0)
    }

    it("is less than another number") {
      expect(42).to.beLessThan(100)
      expect(42.0).to.beLessThan(100.0)
    }

    it("is not less than another number") {
      expect(42).notTo.beLessThan(1)
      expect(42.0).notTo.beLessThan(1.0)
    }

    it("is greater than or equal to another number") {
      expect(42).to.beGreaterThanOrEqual(42)
      expect(42.0).to.beGreaterThanOrEqual(42.0)

      expect(42).to.beGreaterThanOrEqual(1)
      expect(42.0).to.beGreaterThanOrEqual(1.0)
    }

    it("is less than or equal to another number") {
      expect(42).to.beLessThanOrEqual(100)
      expect(42.0).to.beLessThanOrEqual(100.0)

      expect(42).to.beLessThanOrEqual(42)
      expect(42.0).to.beLessThanOrEqual(42.0)
    }

    it("is between two numbers") {
      expect(42).to.beBetween(41, 43)
      expect(42.0).to.beBetween(41.0, 43.0)
    }

    it("is not between two numbers") {
      expect(42).notTo.beBetween(43, 44)
    }

    it("is a nil number") {
      var a : Int?
      expect(a).to.beNil()
    }

    it("is not a nil number") {
      var a : Int? = 42
      expect(1).notTo.beNil()
    }
  }
}
