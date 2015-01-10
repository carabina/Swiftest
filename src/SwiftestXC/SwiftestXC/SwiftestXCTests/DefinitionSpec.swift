import SwiftestXC

class Counter {
  var num = 0
  func inc() { num += 1 }
}

class DefinitionSpec : SwiftestSpec {
  let spec = describe("definitions") {
    let counter = define() { Counter() }
    
    it("defines a closure that returns a value") {
      expect(counter().num).to(.Equal(0))
      counter().inc()
      expect(counter().num).to(.Equal(1))
    }
    
    it("resets the value between each example") {
      expect(counter().num).to(.Equal(0))
    }
  }
}
