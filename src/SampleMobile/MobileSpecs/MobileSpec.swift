import Swiftest
import SampleMobile

class MobileSpec : SwiftestSuite {
  let spec = describe("MobileSpec") {

    it("can test a method on a controller") {
      expect(ViewController().sayHey()).to(.Equal("Hey"))
    }

  }
}
