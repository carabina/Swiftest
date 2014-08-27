import Swiftest

class VoidClosureSpec : SwiftestSuite {
  let spec = describe("void closure expectations") {

    it("asserts what a block changes a value to") {
      var a = 0
      expect({ a += 1 }).to(.Change(a)).to(1)
    }

    it("asserts what a block changes a value from AND to") {
      var a = 1
      expect({ a += 1 }).to(.Change(a)).from(1).to(2)
    }

    it("asserts what a block changes a value by") {
      var a = 0
      expect({ a += 2 }).to(.Change(a)).by(2)
    }
  }
}
