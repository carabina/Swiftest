public class Definition<T> {
  let fn: Void -> T
  var value: T?
  
  init(fn: Void -> T) { self.fn = fn }
  
  func block() -> (Void -> T) {
    return {
      if self.value == nil { self.value = self.fn() }
      return self.value!
    }
  }
  
  public func reset() {
    self.value = nil
  }
}