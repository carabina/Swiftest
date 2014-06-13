import Swiftest
import XCTest

class DictionaryExpectationTest : XCTestCase {
  var dict = ["key" : "value"]

  
  func test_Dictionary() {
    var expect = Swiftest.DictionaryExpectation(actual : dict)
    expect.toEqual(["key":"value"])
    
    XCTAssertEqual(expect.result.status, Swiftest.ExampleStatus.Pass)
  }
  
  func test_DictionaryFail() {
    var expect = Swiftest.DictionaryExpectation(actual : dict)
    expect.toEqual(["other-key":"other-value"])
    
    XCTAssertEqual(expect.result.status, Swiftest.ExampleStatus.Fail)
  }

  func test_toHaveKey() {
    var expect = Swiftest.DictionaryExpectation(actual : dict)
    
    expect.toHaveKey("key")
    XCTAssertEqual(expect.result.status, Swiftest.ExampleStatus.Pass)
  }
  
  func test_toHaveKey_fail() {
    var expect = Swiftest.DictionaryExpectation(actual : dict)
    
    expect.toHaveKey("another-key")
    XCTAssertEqual(expect.result.status, Swiftest.ExampleStatus.Fail)
  }
  
  func test_toHaveValue() {
    var expect = Swiftest.DictionaryExpectation(actual : dict)
    expect.toHaveValue("value")
    
    XCTAssertEqual(expect.result.status, Swiftest.ExampleStatus.Pass)
  }
  
  func test_toHaveValue_fail() {
    var expect = Swiftest.DictionaryExpectation(actual : dict)
    
    expect.toHaveValue("another-value")
    XCTAssertEqual(expect.result.status, Swiftest.ExampleStatus.Fail)
  }
}
