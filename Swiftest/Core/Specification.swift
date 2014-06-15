typealias ExampleBlock = ((Void) -> Void)

extension Swiftest {
  class Specification {
    var name     : String
    var examples : Example[] = []
    var currentExample : Example = Swiftest.nullExample
    
    init(name: String) { self.name = name }
    
    func example(desc: String, blk : ExampleBlock) {
      var example = Example(desc: desc, blk : blk)
      examples.append(example)
    }
    
    func example(desc: String) {
      var example = Example(desc: desc, blk : nil)
      examples.append(example)
    }
    
    func it(desc : String) { example(desc) }
    func it(desc : String, blk : ExampleBlock) { example(desc, blk) }
    
    func run() {
      for example in examples {
        self.currentExample = example
        example.run()
        self.currentExample = Swiftest.nullExample
      }
      
    }
    
    func statuses() -> ExampleStatus[] {
      return examples.map() {(let ex) -> ExampleStatus in
        ex.getStatus()
      }
    }
  }
}