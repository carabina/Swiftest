import Swiftest

class BoolSpec : SwiftestSuite {
  let spec = describe("BoolSpec") {

    it("does okay") {
      expect(true).to(.Be(true))
      expect(true).notTo(.Be(false))
    }

  }
}
