import Swiftest

enum ExampleError : ErrorType {
  case Error
  case Phony
}

enum OtherError : ErrorType {
  case Error
}

func mightThrow(doThrow: Bool) throws -> Bool {
  if doThrow { throw ExampleError.Error }
  return doThrow
}

class VoidClosureSpec: Swiftest.Spec {
  let spec = describe("void closure expectations") {
    it("asserts what a block changes a value to") {
      var a = 0
      expect { a += 1 }.to.change { a }.to(1)
    }

    it("asserts what a block changes a value from AND to") {
      var a = 1
      expect { a += 1 }.to.change { a }.from(1).to(2)
    }

    it("asserts what a block changes a value by") {
      var a = 0
      expect { a += 2 }.to.change { a }.by(2)

      var b = 0.0
      expect { b += 3.14 }.to.change { b }.by(3.14)
    }

    it("asserts that a block will throw an error, with an optional type") {
      expect {
        try expect(mightThrow(false)).to.equal(false)
      }.notTo.throwError()

      expect { try mightThrow(true) }.to.throwError(ExampleError.Error)
      expect { try mightThrow(true) }.notTo.throwError(ExampleError.Phony)
      expect { try mightThrow(true) }.notTo.throwError(OtherError.Error)
    }
  }
}
