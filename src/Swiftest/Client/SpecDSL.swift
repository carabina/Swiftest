import SwiftestCore

public func describe(
  subject: String,
  file: String = __FILE__,
  line: UInt = __LINE__,
  _ blk: Void -> Void
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
  file: String = __FILE__,
  line: UInt = __LINE__,
  _ blk: VoidBlk = {}
) {
  Context.currentSpec.add(
    Example(subject: subject, fn: blk, cursor: Cursor(file: file, line: line))
  )
}

public func before(fn: VoidBlk) {
  Context.currentSpec.addHook(.Before, hook: fn)
}

public func define<T>(fn: Void -> T) -> (Void -> T) {
  let defn = Definition(fn: fn)
  Context.currentSpec.add(defn)
  return defn.block()
}
