import Swiftest
import XCTest

class SwiftestTest : XCTestCase {
  class MyTest : SwiftestSuite {
    var spec =  describe("Swiftest") {
      it("adds 1 + 1!") {
        expect(1 + 1).toEqual(2)
      }
      
      it("knows true from false!") {
        expect(true).toBeTrue()
        expect(true).not().toBeFalse()
      }
      
      example("comparing letters of the alphabet!") {
        expect("abc").toEqual("abc")
      }
      
      it("knows what stuff is NOT other stuff!") {
        expect(2 + 2).not().toEqual(5)
      }
      
      example("arrays!") {
        expect([1, 2, 3]).toEqual([1, 2, 3])
        expect([1, 2, 3]).toContain(1)
      }
      
      example("dictionaries!") {
        expect([ "key" : "val" ]).toEqual([ "key" : "val"])
        expect([ "key" : "val" ]).toHaveKey("key")
        expect([ "key" : "val" ]).toHaveValue("val")
      }
      
      example("your own classes!") {
        let person1 = SwiftestTests.Person(name: "Bob")
        let person2 = SwiftestTests.Person(name: "Alice")
        
        expect(person1).not().toEqual(person2)
      }
    }
  }
  
  class MyFailingTest : SwiftestSuite {
    var spec = Swiftest.describe("failure") {
      it("fails") {
        expect(true).not().toBe(true)
      }
    }
  }
  
  func test_describe() {
    let isPassing:Swiftest.Example -> Bool = { (let ex) in
      return ex.getStatus() == Swiftest.ExampleStatus.Pass
    }
    
    let isFailing:Swiftest.Example -> Bool = { (let ex) in
      return ex.getStatus() == Swiftest.ExampleStatus.Fail
    }

    Swiftest.register([MyTest(), MyFailingTest()])
    Swiftest.run()
    
    let passingResult = Swiftest.specs[0]
    let failingResult = Swiftest.specs[1]
    
    XCTAssertEqual(
      passingResult.examples.filter(isPassing).count,
      passingResult.examples.count,
      "all 'passing' examples pass"
    )
    
    XCTAssertEqual(
      failingResult.examples.filter(isFailing).count,
      failingResult.examples.count,
      "all 'failing' examples fail"
    )
  }
}