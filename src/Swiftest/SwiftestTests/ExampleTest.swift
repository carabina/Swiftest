import Swiftest
import XCTest

class ExampleTest : XCTestCase {
  var example = Example(subject : "the-description", fn:Util.nullFn)

  func test_init() {
    XCTAssertEqual(example.subject, "the-description")
    XCTAssertEqual(example.getStatus(), ExampleStatus.Pending)
  }

  func test_expect() {
    let expectation = example.expect("a")
    XCTAssertEqual(expectation.subject[0]!, "a")
  }

  func test_run() {
    let example = Example(subject: "what", fn: {
      expect(1).toEqual(1)
    })

    example.run()
    XCTAssertEqual(example.getStatus(), ExampleStatus.Pass)
  }

  func test_run_fail() {
    let example = Example(subject: "what", fn: {
      expect(1).toEqual(1)
      expect(1).toEqual(2)
    })

    example.run()

    XCTAssertEqual(example.expectations[0].status, ExampleStatus.Pass)
    XCTAssertEqual(example.expectations[1].status, ExampleStatus.Fail)

    XCTAssertEqual(example.getStatus(), ExampleStatus.Fail)
  }
}
