extension Specification {
  class Context {
    var children: Runnable[] = []
    var onExample : Example = Util.nullExample

    func add(child: Runnable) {
      children.append(child)
    }

    func withExample(ex: Example, fn: VoidBlk) {
      onExample = ex
      fn()
      onExample = Util.nullExample
    }
  }
}
