import Swiftest
import XCTest

class SpecificationTest : XCTestCase {

  let spec = Specification(subject: "the-name")

  func test_init() {
    XCTAssertEqual(spec.subject, "the-name")
    XCTAssertEqual(spec.context.children.count, 0)
  }

  func test_createBlankExample() {
    spec.example("does something", fn:Util.nullFn)

    XCTAssertEqual(spec.context.children.count, 1)
    XCTAssertEqual(spec.context.children[0].getStatus(), .Pending)
  }

  func test_createExampleWithBlock() {
    spec.example("does something", fn: {})
    XCTAssertEqual(spec.context.children.count, 1);
    XCTAssertEqual(spec.context.children[0].getStatus(), .Pending)
  }

  func test_run() {
    spec.example("fails", fn: {
      expect(1).toEqual(2)
    })

    spec.run()

    XCTAssertEqual(spec.context.children[0].getStatus(), .Fail)
  }

}
