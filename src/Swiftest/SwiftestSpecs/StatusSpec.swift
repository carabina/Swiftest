import Swiftest

class StatusSpec : SwiftestSuite {
  let spec = describe("status") {
    it("compares enums that are 'equatable'") {
      expect(Status.Fail).toEqual(Status.Fail)
      expect(Status.Fail).not().toEqual(Status.Pass)
    }
  }
}