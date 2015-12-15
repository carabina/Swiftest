public class Specification : HasStatus {
  public let subject: String
  public let cursor: Cursor
  public let fn: VoidBlk

  public var children: [Specification] = []
  public var examples: [Example] = []
  public var hooks = Hooks()
  public var parents: [Specification] = []
  public var status: Status {
    get {
      return examples.filter {
        $0.status == Status.Fail
      }.isEmpty ? Status.Pass : Status.Fail
    }
  }

  public init(subject: String, _ fn: VoidBlk = {}, cursor: Cursor = nullCursor) {
    self.subject = subject
    self.fn = fn
    self.cursor = cursor
  }

  public func add(example: Example) { examples.append(example) }

  public func add(spec: Specification) {
    spec.addParent(self)
    children.append(spec)
  }

  public func addParent(parent: Specification) {
    parents.append(parent)
    hooks = parent.hooks
  }

  public func addHook(hookType: Hooks.HookType, hook: VoidBlk) {
    hooks.add(hookType, fn: hook)
  }
}

extension Specification : Equatable {}

public func ==(lhs: Specification, rhs: Specification) -> Bool {
  func subject(example: Example) -> String { return example.subject }

  return lhs.subject == rhs.subject && 
    lhs.examples.map(subject) == rhs.examples.map(subject)
}
