extension Swiftest {
  class ExpectationResult {
    var status = ExampleStatus.Pending
    
    func assert(cond : Bool) {
      self.status = cond ? ExampleStatus.Pass : ExampleStatus.Fail
    }
  }
}