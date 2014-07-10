import Swiftest
import XCTest

class ExampleTest : XCTestCase {
  var example = Example(subject : "the-description", fn: nullFn)

  func test_init() {
    XCTAssertEqual(example.subject, "the-description")
    XCTAssertEqual(example.getStatus(), Status.Pending)
  }

  func test_expect() {
    let expectation = example.addExpectation(ScalarExpectation(subject: "a"))
    XCTAssertEqual(expectation.subject!, "a")
  }

  func test_run() {
    let example = Example(subject: "what", fn: {
      expect(1).toEqual(1)
    })

    example.run()
    XCTAssertEqual(example.getStatus(), Status.Pass)
  }

  func test_run_fail() {
    let example = Example(subject: "what", fn: {
      expect(1).toEqual(1)
      expect(1).toEqual(2)
    })

    example.run()

    XCTAssertEqual(example.expectations[0].status, Status.Pass)
    XCTAssertEqual(example.expectations[1].status, Status.Fail)

    XCTAssertEqual(example.getStatus(), Status.Fail)
  }
}
