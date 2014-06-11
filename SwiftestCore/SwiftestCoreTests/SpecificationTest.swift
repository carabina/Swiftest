import XCTest
import SwiftestCore

class SpecificationTest : XCTestCase {
  
  let spec = Specification(name: "the-name")
  
  func test_init() {
    XCTAssertEqual(spec.name, "the-name")
    XCTAssertEqual(spec.examples.count, 0)
  }
  
  func test_createBlankExample() {
    spec.example("does something")
    
    XCTAssertEqual(spec.examples.count, 1)
    XCTAssertEqual(spec.examples[0].status, ExampleStatus.Pending)
  }
  
  func test_createExampleWithBlock() {
    spec.example("does something") { (let ex) in }
    XCTAssertEqual(spec.examples.count, 1);
    XCTAssertEqual(spec.examples[0].status, ExampleStatus.Pending)
  }
  
  func test_Describe() {
    let result = Spec.describe("spec") { (let spec) in
      spec.example("test")
    }
    
    XCTAssertEqual(result.examples.count, 1)
  }
}