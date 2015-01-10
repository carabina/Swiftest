import SwiftestXC
import SwiftestCore

class StatusSpec : SwiftestSpec {
  let spec = describe("status") {
    it("compares enums that are 'equatable'") {
      expect(Status.Fail).to(.Equal(Status.Fail))
      expect(Status.Fail).notTo(.Equal(Status.Pass))
    }
  }
}