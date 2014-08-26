import Swiftest

class ArraySpec : SwiftestSuite {
  let spec = describe("arrays") {
    describe("toContain") {
      it("contains an element") {
        expect([1, 2, 3]).to(.Contain(1))
      }

      it("does not contain an element") {
        expect([1, 2, 3]).notTo(.Contain(4))
      }

      it("contains many elements") {
        expect([1, 2, 3]).to(.ContainEach([1, 2]))
      }
      
      it("does not contain many elements") {
        expect([1, 2, 3]).notTo(.ContainEach([3, 4]))
        expect([1, 2, 3]).notTo(.ContainEach([4, 5]))
      }
    }

    it("equals another array") {
      expect([1, 2, 3]).to(.Equal([1, 2, 3]))
    }
    
    it("does not equal another array") {
      expect([1, 2, 3]).notTo(.Equal([1, 2]))
    }
    
    it("is empty") {
      var emptyList : [Int] = []
      expect(emptyList).to(.BeEmpty)
    }
    
    it("is not empty") {
      expect([1, 2, 3]).notTo(.BeEmpty)
    }
  }
}