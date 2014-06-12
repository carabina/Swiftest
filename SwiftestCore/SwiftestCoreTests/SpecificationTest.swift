import XCTest
import Swiftest

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
  
  func test_run() {
    spec.example("fails") { (let ex) in
      ex.expect(1).toEqual(2)
    }
    
    spec.run()
    
    XCTAssertEqual(spec.examples[0].getStatus(), ExampleStatus.Fail)
  }
  
  func test_it_aliasForExample() {
    spec.it("is pending")
    XCTAssertEqual(spec.examples[0].status, ExampleStatus.Pending)

    spec.it("passes") { (let ex) in
      ex.expect(1).toEqual(1)
    }
    
    spec.run()
    XCTAssertEqual(spec.examples[1].getStatus(), ExampleStatus.Pass)
  }
}