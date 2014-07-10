import Swiftest

class StatusSpec : SwiftestSuite {
  let spec = describe("status") {
    xit("compares enums that are 'equatable'")
    
    // except, it doesn't -- some issue with the way the method is dispatched
    // filed a bug with Apple on this one
  }
}