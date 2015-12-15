import Swiftest

class ArraySpec: Swiftest.Spec {
  let spec = describe("arrays") {
    describe("toContain") {
      it("contains an element") {
        expect([1, 2, 3]).to.contain(1)
      }

      it("does not contain an element") {
        expect([1, 2, 3]).notTo.contain(4)
      }

      it("contains many elements") {
        expect([1, 2, 3]).to.contain(1, 2)
      }

      it("does not contain many elements") {
        expect([1, 2, 3]).notTo.contain(3, 4)
        expect([1, 2, 3]).notTo.contain(4, 5)
      }
    }

    it("equals another array") {
      expect([1, 2, 3]).to.equal([1, 2, 3])
    }

    it("does not equal another array") {
      expect([1, 2, 3]).notTo.equal([1, 2])
    }

    it("is empty") {
      var emptyList : [Int] = []
      expect(emptyList).to.beEmpty()
    }

    it("is not empty") {
      expect([1, 2, 3]).notTo.beEmpty()
    }
  }
}
