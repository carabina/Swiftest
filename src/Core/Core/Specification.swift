public class Specification : HasStatus {
  public let subject: String
  public var timer = Timer()

  public let cursor: Cursor
  public let fn: VoidBlk

  public var children: [Specification] = []
  public var definitions: [Definition<Any>] = []
  public var examples: [Example] = []
  public var hooks = Hooks()
  public var parents: [Specification] = []
  
  public init(subject: String, _ fn: VoidBlk, cursor: Cursor = nullCursor) {
    self.subject = subject
    self.fn = fn
    self.cursor = cursor
  }
  
  public func add(example: Example) { examples.append(example) }

  public func add(spec: Specification) {
    spec.addParent(spec)
    children.append(spec)
  }
  
  public func addParent(spec: Specification) {
    parents.append(spec)
    definitions += spec.definitions
  }
  
  func add(defn: Definition<Any>) {
    definitions.append(defn)
  }
  
  func addHook(ofType: HookType, hook: VoidBlk) {
    hooks.add(ofType, hook: hook)
  }

  func status() -> Status {
    return Status.has(.Fail, within: examples) ? .Fail : .Pass
  }
}