import XCTest
import SwiftestCore

class SwiftestTestClassDude : Comparable {
  var name : String
  
  init(name : String) {
    self.name = name
  }
}

@infix func ==(dude1 :SwiftestTestClassDude, dude2 : SwiftestTestClassDude) -> Bool {
  return dude1.name == dude2.name
}

@infix func <(dude1 : SwiftestTestClassDude, dude2 : SwiftestTestClassDude) -> Bool {
  return dude1.name > dude2.name
}

@infix func >=(dude1 : SwiftestTestClassDude, dude2 : SwiftestTestClassDude) -> Bool {
  return dude1.name >= dude2.name
}

@infix func <=(dude1 : SwiftestTestClassDude, dude2 : SwiftestTestClassDude) -> Bool {
  return dude1.name <= dude2.name
}



class ExpectationTest : XCTestCase {
  
  let expectation = Expectation(actual: "actual")
  
  func test_toEqual_pass() {
    expectation.toEqual("actual")
    XCTAssertEqual(expectation.result.status, ExampleStatus.Pass);
  }
  
  func test_toEqual_fail() {
    expectation.toEqual("not-actual")
    XCTAssertEqual(expectation.result.status, ExampleStatus.Fail);
  }
  
  func test_toEqual_multiple() {
    expectation.toEqual("actual")
    expectation.toEqual("not-actual")
    
    XCTAssertEqual(expectation.result.status, ExampleStatus.Fail);
  }
  
  func test_not_toEqual() {
    expectation.not().toEqual("not-actual")
    XCTAssertEqual(expectation.result.status, ExampleStatus.Pass);
  }
  
  func test_toEqual_int() {
    let ex = Expectation(actual: 1)
    ex.toEqual(1)
    XCTAssertEqual(ex.result.status, ExampleStatus.Pass);
  }
  
  func test_withObjC_Class() {
    let dude1 = SwiftestTestClassDude(name: "dude1")
    let dude2 = SwiftestTestClassDude(name: "dude2")
    let ex = Expectation(actual: dude1)
    ex.toEqual(dude2)
    
    XCTAssertEqual(ex.result.status, ExampleStatus.Fail)
  }
  
}