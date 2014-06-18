extension Swiftest {
  class Specification {
    var examples : Example[] = []
    var onExample : Example = nullExample

    let subject  : String
    let cursor : Cursor
    
    init(subject:String, file:String = __FILE__, line:Int = __LINE__) {
      self.subject = subject
      self.cursor = Cursor(file: file, line: line)
    }
    
    func example(subject:String, fn:VoidFn, file:String = __FILE__, line:Int = __LINE__) {
      examples.append(Example(subject: subject, fn: fn, file: file, line: line))
    }
    
    func run() {
      reporter.specificationStarted(self)
      for example in examples { example.run() }
      reporter.specificationFinished(self)
    }
    
    func withExample(ex: Example, fn: Void -> Void) {
      onExample = ex
      fn()
      onExample = nullExample
    }
  }
}