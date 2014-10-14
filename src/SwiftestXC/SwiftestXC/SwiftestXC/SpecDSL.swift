import SwiftestCore

public enum HookTypeXC {
  case Each
  case All
  
  func toHook() -> HookType {
    switch self {
    case .Each: return HookType.Each
    case .All: return HookType.All
    }
  }
}

public func describe(
  subject: String,
  blk: VoidBlk,
  file: String = __FILE__,
  line: Int = __LINE__
) -> String {
  Context.described(Specification(
    subject: subject,
    blk,
    cursor: Cursor(file: file, line: line)
  ))
  
  return subject
}

public func it(
  subject: String,
  blk: VoidBlk,
  file: String = __FILE__,
  line: Int = __LINE__
) {
  Context.currentSpec().add(
    Example(subject: subject, fn: blk, cursor: Cursor(file: file, line: line))
  )
}

public func before(type: HookTypeXC, fn: VoidBlk) {
  Context.currentSpec().hooks.add(type.toHook(), hook: fn)
}

public func before(fn: VoidBlk) {
  Context.currentSpec().hooks.add(.Each, hook: fn)
}
