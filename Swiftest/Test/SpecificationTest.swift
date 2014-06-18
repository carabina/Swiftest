import Swiftest
import XCTest

class SpecificationTest : XCTestCase {
  
  let spec = Swiftest.Specification(subject: "the-name")
  
  func test_init() {
    XCTAssertEqual(spec.subject, "the-name")
    XCTAssertEqual(spec.examples.count, 0)
  }
  
  func test_createBlankExample() {
    spec.example("does something")
    
    XCTAssertEqual(spec.examples.count, 1)
    XCTAssertEqual(spec.examples[0].getStatus(), Swiftest.ExampleStatus.Pending)
  }
  
  func test_createExampleWithBlock() {
    spec.example("does something") { (let ex) in }
    XCTAssertEqual(spec.examples.count, 1);
    XCTAssertEqual(spec.examples[0].getStatus(), Swiftest.ExampleStatus.Pending)
  }
  
  func test_run() {
    spec.example("fails") {
      expect(1).toEqual(2)
    }
    
    spec.run()
    
    XCTAssertEqual(spec.examples[0].getStatus(), Swiftest.ExampleStatus.Fail)
  }
  
}