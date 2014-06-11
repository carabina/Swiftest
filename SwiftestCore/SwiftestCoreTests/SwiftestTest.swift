import SwiftestCore
import XCTest

class SwiftestTest : XCTestCase {
  
  func test_Describe() {
    let result = Swiftest.describe("a-spec") { (let spec) in
      spec.example("test-one") { (let ex) in
        ex.expect(1).toEqual(1)
        
        ex.expect("abc").toEqual("abc")
        ex.expect("abc").not().toEqual("def")
        
        ex.expect(["a", "b", "c"]).toEqual(["a","b","c"])
        ex.expect(["a", "b", "c"]).not().toEqual([])
        
        ex.expect(["key" : "value"]).toEqual(["key" : "value"])
      }
    }
    
    result.run()
    
    XCTAssertEqual(result.examples.count, 1)
    XCTAssertEqual(result.examples[0].getStatus(), ExampleStatus.Pass)
  }

}
