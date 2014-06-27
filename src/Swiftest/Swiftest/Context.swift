struct Context {

  var specs : Specification[] = []
  var stack : Specification[] = []

  mutating func addSpec(spec : Specification) {
    if(stack.count == 0) {
      specs.append(spec)
    } else {
      current().addSpec(spec)
    }

    stack.append(spec)
  }

  mutating func popSpec() -> Specification {
    return stack.removeLast()
  }

  func current() -> Specification {
    return stack.count > 0 ? stack[stack.count - 1] : Swiftest.nullSpec
  }

  func currentExample() -> Example {
    return current().context.onExample
  }

}
