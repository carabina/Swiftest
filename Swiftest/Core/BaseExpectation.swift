extension Swiftest {
  class BaseExpectation {
    var status = ExampleStatus.Pending
    var _reverse = false
    var msg = "expectation failed"
    var example = nullExample
    
    var cursor : Cursor?
    
    init() {
      
    }
    
    func _assert(cond:Bool) {
      self.status = cond ^ _reverse ? ExampleStatus.Pass : ExampleStatus.Fail
      
      switch status {
      case ExampleStatus.Pass: reporter.expectationPassed(self)
      case ExampleStatus.Fail: reporter.expectationFailed(self)
      default: ()
      }
    }
    
    func _assert(cond:Bool, msg:String) {
      self.msg = msg
      _assert(cond)
    }
    
    func _includeNot() -> String {
      return _reverse ? " not" : ""
    }
  }
}