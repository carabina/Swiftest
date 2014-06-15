import Swiftest
import XCTest

class ReporterTest : XCTestCase {
  var reporter = Swiftest.Reporter()
  var listener = SwiftestTests.MockListener(name : "my-listener")
  let spec = Swiftest.Specification(name : "test-spec")
  let example = Swiftest.Example(desc : "test-example")
  
  override func setUp() {
    reporter.addListener(listener)
  }
  
  func test_zeroListenersOnInit() {
    var reporter = Swiftest.Reporter()
    XCTAssertEqual(reporter.listeners.count, 0)
  }
  
  func test_addListener() {
    XCTAssertEqual(reporter.listeners.count, 1)
    
    let addedListener = reporter.listeners[0]

    XCTAssertEqual(addedListener.name, listener.name)
  }
  
  func test_notifySuiteStarted() {
    XCTAssertEqual(listener.suiteStartedCalls.count, 0)
    reporter.suiteStarted()
    XCTAssertEqual(listener.suiteStartedCalls.count, 1)
  }
  
  func test_notifySuiteFinished() {
    XCTAssertEqual(listener.suiteFinishedCalls.count, 0)
    reporter.suiteFinished()
    XCTAssertEqual(listener.suiteFinishedCalls.count, 1)
  }
  
  func test_notifySpecificationStarted() {
    XCTAssertEqual(listener.specificationStartedCalls.count, 0)
    reporter.specificationStarted(spec)
    
    XCTAssertEqual(listener.specificationStartedCalls[0], spec.name)
  }
  
  func test_notifySpecificationFinished() {
    XCTAssertEqual(listener.specificationFinishedCalls.count, 0)
    reporter.specificationFinished(spec)
    
    XCTAssertEqual(listener.specificationFinishedCalls.count, 1)
    XCTAssertEqual(listener.specificationFinishedCalls[0], spec.name)
  }
  
  func test_notifyExampleStarted() {
    XCTAssertEqual(listener.exampleStartedCalls.count, 0)
    reporter.exampleStarted(example)

    XCTAssertEqual(listener.exampleStartedCalls.count, 1)
    XCTAssertEqual(listener.exampleStartedCalls[0], example.description)
  }
  
  func test_notifyExampleFinished() {
    XCTAssertEqual(listener.exampleFinishedCalls.count, 0)
    
    reporter.exampleFinished(example)
    XCTAssertEqual(listener.exampleFinishedCalls.count, 1)
    XCTAssertEqual(listener.exampleFinishedCalls[0], example.description)
  }
  
  func test_notifyExpectationPassed() {
    let expectation = Swiftest.ScalarExpectation(actual: 1)
    expectation.toEqual(1)
    XCTAssertEqual(listener.expectationPassedCalls.count, 0)
    
    reporter.expectationPassed(expectation, example: example)
    XCTAssertEqual(listener.expectationPassedCalls.count, 1)
    XCTAssertEqual(listener.expectationPassedCalls[0], Swiftest.ExampleStatus.Pass)
  }
  
  func test_notifyExpectationFailed() {
    let expectation = Swiftest.ScalarExpectation(actual: 1)
    expectation.toEqual(2)
    XCTAssertEqual(listener.expectationFailedCalls.count, 0)
    
    reporter.expectationFailed(expectation, example: example)
    XCTAssertEqual(listener.expectationFailedCalls.count, 1)
    XCTAssertEqual(listener.expectationFailedCalls[0], Swiftest.ExampleStatus.Fail)
  }
}