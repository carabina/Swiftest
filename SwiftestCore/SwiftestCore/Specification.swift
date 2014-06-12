typealias ExampleBlock = ((Example) -> Void)

class Specification {
  var name     : String
  var examples : Example[] = []
  
  init(name: String) {
    self.name = name
  }
  
  func example(desc: String, blk : ExampleBlock) {
    var example = Example(desc: desc, blk : blk)
    examples.append(example)
  }
  
  func example(desc: String) {
    var example = Example(desc: desc, blk : nil)
    examples.append(example)
  }
  
  func run() {
    for example in self.examples {
      example.run()
    }
  }
  
  func statuses() {
    examples.map() { (let ex) -> ExampleStatus in
      ex.getStatus()
    }
  }

}
