import SwiftestClient

describe("hooks") {
  var eachCount = 0

  describe("each") {
    before() { eachCount += 1 }

    it("gets run before each example") {
      expect(eachCount).to.equal(1)
    }

    it("has run twice for the second example") {
      expect(eachCount).to.equal(2)
    }

    describe("nested hooks") {
      before() { eachCount += 1 }

      it("run the blocks of the parent specs as well as nested") {
        expect(eachCount).to.equal(4)
      }
    }

    describe("other nested hooks") {
      it("only runs parent hooks if no child hooks are defined") {
        expect(eachCount).to.equal(5)
      }
    }
  }
}
