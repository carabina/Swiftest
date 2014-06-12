import XCTest
import Swiftest

class ExampleTest : XCTestCase {
  var example = Example(desc : "the-description", blk : nil)
  
  func test_init() {
    XCTAssertEqual(example.description, "the-description")
    XCTAssertEqual(example.status, ExampleStatus.Pending)
  }
  
  func test_expect() {
    let expectation = example.expect("a")
    XCTAssertEqual(expectation.actual[0]!, "a")
  }
  
  func test_run() {
    let example = Example(desc: "what") {
      expect(1).toEqual(1)
    }
  
    example.run()
    XCTAssertEqual(example.getStatus(), ExampleStatus.Pass)
  }
  
  func test_run_fail() {
    let example = Example(desc: "what") {
      expect(1).toEqual(1)
      expect(1).toEqual(2)
    }
    
    example.run()
    
    XCTAssertEqual(example.results[0].status, ExampleStatus.Pass)
    XCTAssertEqual(example.results[1].status, ExampleStatus.Fail)
    
    XCTAssertEqual(example.getStatus(), ExampleStatus.Fail)
  }
}