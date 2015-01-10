import SwiftestXC

class VoidClosureSpec : SwiftestSpec {
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
      
      var b = 0.0
      expect({ b += 3.14 }).to(.Change(b)).by(3.14)
    }
  }
}