import XCTest
import SwiftestCore

class ExampleTest : XCTestCase {
    var example = Example(desc : "the-description", blk : nil)

    func test_init() {
        XCTAssertEqual(example.description, "the-description")
        XCTAssertEqual(example.status, ExampleStatus.Pending)
    }
}