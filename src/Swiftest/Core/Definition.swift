public protocol Resettable {
  func reset()
}

public class Definition<T> : Resettable {
  let fn: Void -> T
  var value: T?

  public init(fn: Void -> T) { self.fn = fn }

  public func block() -> (Void -> T) {
    return {
      if self.value == nil { self.value = self.fn() }
      return self.value!
    }
  }

  public func reset() {
    self.value = nil
  }
}
