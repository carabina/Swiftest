import Swiftest

class FailingSpec : SwiftestSuite {
  let spec = describe("failure") {

    it("passing example to better illustrate formatting") {
      expect(true).notTo(.Be(false))
    }

    it("asplodes") {
      expect(true).to(.Be(false))
      expect(true).notTo(.Be(true))
    }

    it("formats failure nicely") {
      expect(1).to(.Equal(2))
    }
  }
}
