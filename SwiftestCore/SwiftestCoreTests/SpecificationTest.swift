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
}