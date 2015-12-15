public func describe(
  subject: String,
  file: String = __FILE__,
  line: UInt = __LINE__,
  _ blk: Void -> Void
) -> String {
  let spec = Specification(
    subject: subject,
    blk,
    cursor: Cursor(file: file, line: line)
  )

  Context.described(spec)

  return subject
}

public func it(
  subject: String,
  file: String = __FILE__,
  line: UInt = __LINE__,
  _ blk: ExampleFn = {}
) {
  Context.currentSpec.add(
    Example(subject: subject, fn: blk, cursor: Cursor(file: file, line: line))
  )
}

public func before(fn: VoidBlk) {
  Context.currentSpec.addHook(.Before, hook: fn)
}
