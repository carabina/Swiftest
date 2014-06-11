import XCTest
import SwiftestCore

class ExpectationSpec : XCTestCase {
  
  let expectation = Expectation(actual: "actual")
  
  func test_toEqual_pass() {
    expectation.toEqual("actual")
    XCTAssertEqual(expectation.result.status, ExampleStatus.Pass);
  }
  
  func test_toEqual_fail() {
    expectation.toEqual("not-actual")
    XCTAssertEqual(expectation.result.status, ExampleStatus.Fail);
  }
  
  func test_toEqual_multiple() {
    expectation.toEqual("actual")
    expectation.toEqual("not-actual")
    
    XCTAssertEqual(expectation.result.status, ExampleStatus.Fail);
  }
  
  func test_not_toEqual() {
    expectation.not().toEqual("not-actual")
    XCTAssertEqual(expectation.result.status, ExampleStatus.Pass);
  }
  
}