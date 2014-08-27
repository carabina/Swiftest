public func before(hook: HookType, fn: VoidBlk) {
  current().before(hook, fn: fn)
}

public func before(fn: VoidBlk) { before(.each, fn) }

public func describe(
  subject: String,
  fn: VoidBlk,
  file: String = __FILE__,
  line: Int = __LINE__
) -> Specification {
  return Swiftest.describe(
    subject,
    fn: fn,
    cursor: Cursor(file: file, line: line)
  )
}

public func define<T>(fn: @autoclosure () -> T) -> Void -> T {
  return current().define(fn)
}

public func example(
  subject: String,
  _ fn: VoidBlk = nullFn,
  file: String = __FILE__,
  line: Int = __LINE__
) {
  current().addExample(subject, fn: fn, cursor: Cursor(file: file, line: line))
}

public func it(
  desc: String,
  _ fn: VoidBlk = nullFn,
  file: String = __FILE__,
  line: Int = __LINE__
) {
  example(desc, fn, file: file, line: line)
}

public func xit(
  desc: String,
  _ fn: VoidBlk = nullFn,
  file: String = __FILE__,
  line: Int = __LINE__
) {
  example(desc, file: file, line: line)
}

func current() -> Specification {
  return Swiftest.context.current()
}
