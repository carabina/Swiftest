import SwiftestClient

class Counter {
  var num = 0; func inc() { num += 1 }
}

describe("defines") {

  let counter = define() { Counter() }

  it("creates a closure that returns the value") {
    counter().inc()
    expect(counter().num).to.equal(1)
  }

  it("re-sets the value for each example") {
    expect(counter().num).to.equal(0)
  }

  describe("nesting") {
    it("creates a closure for nested examples") {
      counter().inc()
      expect(counter().num).to.equal(1)
    }

    it("re-sets it for nested examples too") {
      expect(counter().num).to.equal(0)
    }
  }
}
