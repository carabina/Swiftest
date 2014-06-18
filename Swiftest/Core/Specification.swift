typealias ExampleBlock = ((Void) -> Void)

extension Swiftest {
  class Specification {
    var subject  : String
    var examples : Example[] = []
    var onExample : Example = nullExample
    
    init(subject : String) { self.subject = subject }
    
    func example(desc : String, blk : ExampleBlock = nullBlock) {
      examples.append(Example(desc: desc, blk : blk))
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