import Swiftest
import XCTest


class ExampleTest : XCTestCase {
  var example = Swiftest.Example(desc : "the-description", blk : nil)
  
  func test_init() {
    XCTAssertEqual(example.description, "the-description")
    XCTAssertEqual(example.getStatus(), Swiftest.ExampleStatus.Pass)
  }
  
  func test_expect() {
    let expectation = example.expect("a")
    XCTAssertEqual(expectation.actual[0]!, "a")
  }
  
  func test_run() {
    let example = Swiftest.Example(desc: "what") {
      expect(1).toEqual(1)
    }
  
    example.run()
    XCTAssertEqual(example.getStatus(), Swiftest.ExampleStatus.Pass)
  }
  
  func test_run_fail() {
    let example = Swiftest.Example(desc: "what") {
      expect(1).toEqual(1)
      expect(1).toEqual(2)
    }
    
    example.run()
    
    XCTAssertEqual(example.results[0].status, Swiftest.ExampleStatus.Pass)
    XCTAssertEqual(example.results[1].status, Swiftest.ExampleStatus.Fail)
    
    XCTAssertEqual(example.getStatus(), Swiftest.ExampleStatus.Fail)
  }
}