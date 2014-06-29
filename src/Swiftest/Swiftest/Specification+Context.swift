extension Specification {
  class Context {
    var children: Runnable[] = []
    var onExample : Example = Util.nullExample

    func add(child: Runnable) {
      children.append(child)
    }
  }
}
