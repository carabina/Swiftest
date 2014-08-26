protocol Assertion {
  var msg: String { get }
  var call: Void -> Bool { get }
  var reverse : Bool { get }
}

class BaseAssertion<T> : Assertion {
  let msg : String
  let call : Void -> Bool
  let reverse : Bool
  
  init(
    subject: T?,
    expected: T?,
    call: Void -> Bool,
    msg: String,
    reverse: Bool = false
  ) {
    self.call = call
    self.reverse = reverse
    
    let verb = reverse ? "not to" : "to"
    self.msg = "expected \(subject) \(verb) \(msg)"
  }
  
  init(
    subject: [T]?,
    expected: [T]?,
    call: Void -> Bool,
    msg: String,
    reverse: Bool = false
  ) {
    self.call = call
    self.reverse = reverse
    
    let verb = reverse ? "not to" : "to"
    self.msg = "expected \(subject) \(verb) \(msg)"
  }
}

class DictAssertion<K:Hashable, V> : Assertion {
  let msg : String
  let call : Void -> Bool
  let reverse : Bool
  
  init(
    subject: Dictionary<K,V>?,
    expected: Dictionary<K,V>?,
    call: Void -> Bool,
    msg: String,
    reverse: Bool
  ) {
    self.call = call
    self.reverse = reverse
    
    let verb = reverse ? "not to" : "to"
    self.msg = "expected \(subject) \(verb) \(msg)"
  }
}

class AssertionBuild<T> {
  var subject : T?
  var reverse : Bool
  
  init(subject: T?, reverse: Bool) {
    self.subject = subject
    self.reverse = reverse
  }
  
  func build(expected: T?, _ call: Void -> Bool, _ msg: String) -> BaseAssertion<T> {
    return BaseAssertion(
      subject: subject,
      expected: expected,
      call: call,
      msg:msg,
      reverse: reverse
    )
  }
}

class ArrayAssertionBuild<T> {
  var subject : [T]?
  var reverse : Bool
  
  init(subject: [T]?, reverse: Bool) {
    self.subject = subject
    self.reverse = reverse
  }
  
  func build(expected: [T]?, _ call: Void -> Bool, _ msg: String) -> BaseAssertion<T> {
    return BaseAssertion(
      subject: subject,
      expected: expected,
      call: call,
      msg: msg,
      reverse: reverse
    )
  }
}

class DictionaryAssertionBuild<K:Hashable,V> {
  var subject : Dictionary<K,V>
  var reverse : Bool
  
  init(subject: Dictionary<K,V>, reverse: Bool) {
    self.subject = subject
    self.reverse = reverse
  }
  
  func build(expected: Dictionary<K,V>?, _ call: Void -> Bool, _ msg: String) -> DictAssertion<K,V> {
    return DictAssertion(
      subject: subject,
      expected: expected,
      call: call,
      msg:msg,
      reverse: reverse
    )
  }
}