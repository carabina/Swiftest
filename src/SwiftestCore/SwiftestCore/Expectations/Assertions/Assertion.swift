protocol Assertion {
  var msg: String { get }
  var call: Void -> Bool { get }
  var reverse: Bool { get }
}