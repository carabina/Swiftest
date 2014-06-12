import Swiftest
import XCTest

class ExpectationResultTest : XCTestCase {
  let res = ExpectationResult()
  
  func test_pending() {
    XCTAssertEqual(res.status, ExampleStatus.Pending)
  }
  
  func test_assert_true() {
    res.assert(true)
    
    XCTAssertEqual(res.status, ExampleStatus.Pass)
  }
  
  func test_assert_false() {
    res.assert(false)
    
    XCTAssertEqual(res.status, ExampleStatus.Fail)
  }
}
