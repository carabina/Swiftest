import Swiftest
import XCTest

class ArrayExpectationTest : XCTestCase {

  func test_Collection() {
    let expect = Swiftest.ArrayExpectation(actual : [1, 2])
    expect.toEqual([1, 2])

    XCTAssertEqual(expect.status, Swiftest.ExampleStatus.Pass)
  }

  func test_toEqual_Fail() {
    let expect = Swiftest.ArrayExpectation(actual : [1, 2])
    expect.toEqual([1, 2, 3])

    XCTAssertEqual(expect.status, Swiftest.ExampleStatus.Fail)
  }

  func test_toContain() {
    let expect = Swiftest.ArrayExpectation(actual: [1, 2])

    expect.toContain(1)
    XCTAssertEqual(expect.status, Swiftest.ExampleStatus.Pass)
  }

  func test_toContain_Fail() {
    let expect = Swiftest.ArrayExpectation(actual : [1, 2])

    expect.toContain(3)
    XCTAssertEqual(expect.status, Swiftest.ExampleStatus.Fail)
  }
  
  func test_not_toContain_Pass() {
    let expect = Swiftest.ArrayExpectation(actual : [1, 2])
    
    expect.not().toContain(3)
    XCTAssertEqual(expect.status, Swiftest.ExampleStatus.Pass)
  }
  
  func test_not_toContain_Fail() {
    let expect = Swiftest.ArrayExpectation(actual : [1, 2])
    
    expect.not().toContain(2)
    XCTAssertEqual(expect.status, Swiftest.ExampleStatus.Fail)
  }

}
