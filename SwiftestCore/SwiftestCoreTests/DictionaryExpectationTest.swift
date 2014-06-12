import Foundation
import XCTest
import SwiftestCore

class DictionaryExpectationTest : XCTestCase {
  var dict = ["key" : "value"]

  
  func test_Dictionary() {
    var expect = DictionaryExpectation(actual : dict)
    expect.toEqual(["key":"value"])
    
    XCTAssertEqual(expect.result.status, ExampleStatus.Pass)
  }
  
  func test_DictionaryFail() {
    var expect = DictionaryExpectation(actual : dict)
    expect.toEqual(["other-key":"other-value"])
    
    XCTAssertEqual(expect.result.status, ExampleStatus.Fail)
  }

}
