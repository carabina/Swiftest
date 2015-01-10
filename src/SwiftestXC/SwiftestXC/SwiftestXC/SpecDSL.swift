import SwiftestCore

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
  Context.currentSpec.add(
    Example(subject: subject, fn: blk, cursor: Cursor(file: file, line: line))
  )
}

public func before(fn: VoidBlk) {
  Context.currentSpec.addHook(.Before, fn)
}

public func define<T>(fn: Void -> T) -> (Void -> T) {
  let defn = Definition(fn: fn)
  Context.currentSpec.define(defn)
  return defn.block()
}