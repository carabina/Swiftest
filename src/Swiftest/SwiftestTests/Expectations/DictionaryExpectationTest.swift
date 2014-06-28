import Swiftest
import XCTest

class DictionaryExpectationTest : XCTestCase {
  var dict = ["key" : "value"]

  func test_Dictionary() {
    var expect = DictionaryExpectation(subject : dict)
    expect.toEqual(["key":"value"])

    XCTAssertEqual(expect.status, .Pass)
  }

  func test_DictionaryFail() {
    var expect = DictionaryExpectation(subject : dict)
    expect.toEqual(["other-key":"other-value"])

    XCTAssertEqual(expect.status, .Fail)
  }

  func test_toHaveKey() {
    var expect = DictionaryExpectation(subject : dict)

    expect.toHaveKey("key")
    XCTAssertEqual(expect.status, .Pass)
  }

  func test_toHaveKey_fail() {
    var expect = DictionaryExpectation(subject : dict)

    expect.toHaveKey("another-key")
    XCTAssertEqual(expect.status, .Fail)
  }

  func test_toHaveValue() {
    var expect = DictionaryExpectation(subject : dict)
    expect.toHaveValue("value")

    XCTAssertEqual(expect.status, .Pass)
  }

  func test_toHaveValue_fail() {
    var expect = DictionaryExpectation(subject : dict)

    expect.toHaveValue("another-value")
    XCTAssertEqual(expect.status, .Fail)
  }
}
