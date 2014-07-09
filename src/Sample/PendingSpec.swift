import Swiftest

class PendingSpec : SwiftestSuite {
  let spec = describe("pending specs") {
    it("is a pending spec if there is no body passed")

    xit("is a pending spec if marked with 'xit'") {
      assert(false, "this example should not be run")
    }

    xit("is a pending spec with no body marked with 'xit'")
  }
}