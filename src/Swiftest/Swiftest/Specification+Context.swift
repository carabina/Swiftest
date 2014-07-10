extension Specification {
  class Context {

    var children : [Runnable] = []
    var beforeEach : [VoidBlk] = []
    var beforeAll : [VoidBlk]  = []
    var onExample : Example = nullExample

    func add(child: Runnable) {
      children.append(child)
    }

    func withExample(ex: Example, fn: VoidBlk) {
      onExample = ex
      fn()
      onExample = nullExample
    }

    func examples() -> [Example] {
      return children.filter({ c in c.ofType == "Example" })
        .map({ c in c as Example })
    }

    func specs() -> [Specification] {
      return children.filter({ c in c.ofType == "Specification" })
        .map({ c in c as Specification })
    }

    func sort() {
      children.sort({ (r1, r2) in r1.ofType < r2.ofType })
    }

  }
}
