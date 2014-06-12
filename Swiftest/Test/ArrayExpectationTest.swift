import Foundation
import Swiftest
import XCTest

class ArrayExpectationTest : XCTestCase {

  func test_Collection() {
    let expect = ArrayExpectation(actual : [1, 2])
    expect.toEqual([1, 2])

    XCTAssertEqual(expect.result.status, ExampleStatus.Pass)
  }

  func test_toEqual_Fail() {
    let expect = ArrayExpectation(actual : [1, 2])
    expect.toEqual([1, 2, 3])

    XCTAssertEqual(expect.result.status, ExampleStatus.Fail)
  }

  func test_toContain() {
    let expect = ArrayExpectation(actual: [1, 2])

    expect.toContain(1)
    XCTAssertEqual(expect.result.status, ExampleStatus.Pass)
  }

  func test_toContain_Fail() {
    let expect = ArrayExpectation(actual : [1, 2])

    expect.toContain(3)
    XCTAssertEqual(expect.result.status, ExampleStatus.Fail)
  }

}
