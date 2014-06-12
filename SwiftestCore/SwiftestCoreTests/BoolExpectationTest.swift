import Foundation
import SwiftestCore
import XCTest

class BoolExpectationTest : XCTestCase {
  
  let ex = BoolExpectation(actual : true)
  
  func test_truth_pass() {
    ex.toBe(true)
    ex.toEqual(true)
    ex.toBeTrue()
    
    ex.not().toBe(false)
    ex.not().toEqual(false)
    ex.not().toBeFalse()
    
    XCTAssertEqual(ex.result.status, ExampleStatus.Pass)
  }
  
  func test_truth_toBe_fail() {
    ex.toBe(false)
    XCTAssertEqual(ex.result.status, ExampleStatus.Fail)
  }

  func test_truth_toEqual_fail() {
    ex.toEqual(false)
    XCTAssertEqual(ex.result.status, ExampleStatus.Fail)
  }
  
  func test_truth_toBeFalse_fail() {
    ex.toBeFalse()
    XCTAssertEqual(ex.result.status, ExampleStatus.Fail)
  }


}
