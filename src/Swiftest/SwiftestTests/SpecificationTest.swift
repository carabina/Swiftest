import Swiftest
import XCTest

class Counter {
  var num = 0

  func increment() {
    num += 1
  }
}

class SpecificationTest : XCTestCase {

  let spec = Specification(subject: "the-name")

  func test_init() {
    XCTAssertEqual(spec.subject, "the-name")
    XCTAssertEqual(spec.context.children.count, 0)
  }

  func test_createBlankExample() {
    spec.example("does something", fn: nullFn)

    XCTAssertEqual(spec.context.children.count, 1)
    XCTAssertEqual(spec.context.children[0].getStatus(), Status.Pending)
  }

  func test_createExampleWithBlock() {
    spec.example("does something", fn: {})
    XCTAssertEqual(spec.context.children.count, 1);
    XCTAssertEqual(spec.context.children[0].getStatus(), Status.Pending)
  }

  func test_define() {
    let counter = spec.define() { Counter() }
    counter().increment()

    XCTAssertEqual(counter().num, 1)

    spec.context.definitions[0].reset()
    XCTAssertEqual(counter().num, 0)
  }

  func test_run() {
    spec.example("fails", fn: {
      expect(1).toEqual(2)
    })

    spec.run()

    XCTAssertEqual(spec.context.children[0].getStatus(), Status.Fail)
  }

}
