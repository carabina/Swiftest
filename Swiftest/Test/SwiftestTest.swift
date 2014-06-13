import Swiftest
import XCTest

class SwiftestTest : XCTestCase {
  
  func test_Describe() {
    let result = describe("a-spec") { (let spec) in
      spec.example("test-one") {
        expect(true).toEqual(true)
        expect(true).not().toBe(false)
        
        expect(1).toEqual(1)
        
        expect("abc").toEqual("abc")
        expect("abc").not().toEqual("def")
        
        expect(["a", "b", "c"]).toEqual(["a","b","c"])
        expect(["a", "b", "c"]).not().toEqual([])
        
        expect(["key" : "value"]).toEqual(["key" : "value"])
      }
      
      spec.it("fails") {
        expect(true).not().toBe(true)
      }
    }
    
    result.run()
    
    XCTAssertEqual(result.examples.count, 2)
    XCTAssertEqual(result.examples[0].getStatus(), Swiftest.ExampleStatus.Pass)
    XCTAssertEqual(result.examples[1].getStatus(), Swiftest.ExampleStatus.Fail)
  }
}