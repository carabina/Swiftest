import Swiftest

class BoolSpec: Swiftest.Spec {
  let spec = describe("specifying booleans") {
    it("passes when true is true") {
      expect(true).to.equal(true)
    }

    it("passes when true is not false") {
      expect(true).notTo.equal(false)
    }

    it("passes when false is false") {
      expect(false).to.equal(false)
    }

    it("passes when false is not true") {
      expect(false).notTo.equal(true)
    }
  }
}
