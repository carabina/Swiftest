import Swiftest

class Counter {
  var num = 0; func inc() { num += 1 }
}

class DefineSpec : SwiftestSuite {
  let spec = describe("defines") {

    var counter = define(Counter())

    it("creates a closure that returns the value") {
      counter().inc()
      expect(counter().num).toEqual(1)
    }

    it("re-sets the value for each example") {
      expect(counter().num).toEqual(0)
    }
    
    describe("nesting") {
      it("creates a closure for nested examples") {
        counter().inc()
        expect(counter().num).toEqual(1)
      }
      
      it("re-sets it for nested examples too") {
        expect(counter().num).toEqual(0)
      }
    }
  }
}
