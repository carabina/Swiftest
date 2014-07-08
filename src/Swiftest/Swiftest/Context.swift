struct Context {

  var specs: [Specification] = []
  var stack: [Specification] = []

  mutating func addSpec(spec: Specification) {
    stack.isEmpty ? specs.append(spec) : current().addSpec(spec)
    stack.append(spec)
  }

  mutating func popSpec() -> Specification {
    return stack.removeLast()
  }

  func current() -> Specification {
    return stack.isEmpty ? Util.nullSpec : stack[stack.count - 1]
  }

  func currentExample() -> Example {
    return current().context.onExample
  }

}
