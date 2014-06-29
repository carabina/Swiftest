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
        expect([ "key" : "val", "key2" : "val2"]).toContain([ "key2" : "val2"])
      }

      example("your own classes!") {
        let person1 = SwiftestTests.Person(name: "Bob")
        let person2 = SwiftestTests.Person(name: "Alice")

        expect(person1).not().toEqual(person2)
      }
    }
  }

  class MyFailingTest : SwiftestSuite {
    var spec = Swiftest.describe("failure", fn: {
      it("fails") {
        expect(true).not().toBe(true)
        expect(1 + 1).toEqual(2)
        expect(true).toBeFalse()
      }
    })
  }

  func test_describe() {
    let isPassing:Runnable -> Bool = { (let ex) in
      return ex.getStatus() == .Pass
    }

    let isFailing:Runnable -> Bool = { (let ex) in
      return ex.getStatus() == .Fail
    }

    let specs = [MyTest(), MyFailingTest()]
    Swiftest.systemListener.onFinish = {}
    Swiftest.run()

    let passingResult = Swiftest.context.specs[0]
    let failingResult = Swiftest.context.specs[1]

    XCTAssertEqual(
      passingResult.context.children.filter(isPassing).count,
      passingResult.context.children.count,
      "all 'passing' examples pass"
    )

    XCTAssertEqual(
      failingResult.context.children.filter(isFailing).count,
      failingResult.context.children.count,
      "all 'failing' examples fail"
    )
  }
}
