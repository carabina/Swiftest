protocol Resettable {
  func reset()
}

class Definition<T> : Resettable {
  let fn : Void -> T
  var value : T?

  init(fn: Void -> T) { self.fn = fn }

  func block() -> Void -> T {
    return {
      if let val = self.value {
        return val
      } else {
        self.value = self.fn()
        return self.value!
      }
    }
  }

  func reset() { self.value = nil }
}