import Foundation
import SwiftestCore
import XCTest

class CollectionExpectationTest : XCTestCase {
  
  func test_Collection() {
    let expect = CollectionExpectation(actual : [1, 2])
    expect.toEqual([1, 2])

    XCTAssertEqual(expect.result.status, ExampleStatus.Pass)
  }
  
  func test_toEqual_Fail() {
    let expect = CollectionExpectation(actual : [1, 2])
    expect.toEqual([1, 2, 3])
    
    XCTAssertEqual(expect.result.status, ExampleStatus.Fail)
  }
  
  func test_toContain() {
    let expect = CollectionExpectation(actual: [1, 2])
    
    expect.toContain(1)
    XCTAssertEqual(expect.result.status, ExampleStatus.Pass)
  }
  
  func test_toContain_Fail() {
    let expect = CollectionExpectation(actual : [1, 2])
    
    expect.toContain(3)
    XCTAssertEqual(expect.result.status, ExampleStatus.Fail)
  }
  
}
