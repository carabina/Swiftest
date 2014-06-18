extension Swiftest {
  struct Context {
    
    var specs : Specification[] = []
    var stack : Specification[] = []
    
    mutating func addSpec(spec : Specification) {
      specs.append(spec)
      stack.append(spec)
    }
    
    mutating func popSpec() -> Specification {
      return stack.removeLast()
    }
    
    func current() -> Specification {
      return stack.count > 0 ? stack[stack.count - 1] : nullSpec
    }
    
    func currentExample() -> Example {
      return current().onExample
    }
    
  }
}