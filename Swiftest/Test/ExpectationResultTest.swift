import Swiftest
import XCTest

class ExpectationResultTest : XCTestCase {
  let res = Swiftest.ExpectationResult()
  
  func test_pending() {
    XCTAssertEqual(res.status, Swiftest.ExampleStatus.Pending)
  }
  
  func test_assert_true() {
    res.assert(true)
    
    XCTAssertEqual(res.status, Swiftest.ExampleStatus.Pass)
  }
  
  func test_assert_false() {
    res.assert(false)
    
    XCTAssertEqual(res.status, Swiftest.ExampleStatus.Fail)
  }
}
