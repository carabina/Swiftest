import Swiftest
import XCTest

class ExpectationTest : XCTestCase {

  let expectation = ScalarExpectation(subject: "subject")

  func test_toEqual_pass() {
    expectation.toEqual("subject")
    XCTAssertEqual(expectation.status, Status.Pass);
  }

  func test_toEqual_fail() {
    expectation.toEqual("not-subject")
    XCTAssertEqual(expectation.status, Status.Fail);
  }

  func test_toEqual_multiple() {
    expectation.toEqual("subject")
    expectation.toEqual("not-subject")

    XCTAssertEqual(expectation.status, Status.Fail);
  }

  func test_not_toEqual() {
    expectation.not().toEqual("not-subject")
    XCTAssertEqual(expectation.status, Status.Pass);
  }

  func test_toEqual_int() {
    let ex = ScalarExpectation(subject: 1)
    ex.toEqual(1)
    XCTAssertEqual(ex.status, Status.Pass);
  }

  func test_toEqual_withClass() {
    let p1 = SwiftestTests.Person(name: "p1")
    let p2 = SwiftestTests.Person(name: "p2")
    let ex = ScalarExpectation(subject: p1)
    ex.toEqual(p2)

    XCTAssertEqual(ex.status, Status.Fail)
  }

  func test_toBeNil_withNil() {
    var p1 :  SwiftestTests.Person?
    let ex = ScalarExpectation(subject: p1)

    ex.toBeNil()

    XCTAssertEqual(ex.status, Status.Pass)
  }

  func test_toBeNil_withNonNil() {
    var p1 :  SwiftestTests.Person? = SwiftestTests.Person(name: "p1")
    let ex = ScalarExpectation(subject: p1)

    ex.toBeNil()

    XCTAssertEqual(ex.status, Status.Fail)
  }

  func testComparisons() {
    let ex = ScalarExpectation(subject: 1)

    ex.toBeGreaterThan(0)
    ex.toBeGreaterThanOrEqualTo(0)
    ex.toBeGreaterThanOrEqualTo(1)
    ex.toBeLessThan(2)
    ex.toBeLessThanOrEqualTo(2)
    ex.toBeLessThanOrEqualTo(1)
    ex.toBeGreaterThanOrEqualTo(nil)

    XCTAssertEqual(ex.status, Status.Pass)
  }
}
