func describe(
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

func example(
  subject: String,
  fn: VoidBlk,
  file: String = __FILE__,
  line: Int = __LINE__
) {
  __current().example(subject, fn: fn, cursor: Cursor(file: file, line: line))
}

func example(desc: String, file: String = __FILE__, line: Int = __LINE__) {
  __current().example(desc, fn: nullFn, cursor: Cursor(file: file, line: line))
}

func it(
  desc: String,
  fn: VoidBlk,
  file: String = __FILE__,
  line: Int = __LINE__
) {
  __current().example(desc, fn: fn, cursor: Cursor(file: file, line: line))
}

func it(
  desc: String,
  file: String = __FILE__,
  line: Int = __LINE__
) {
  __current().example(desc, fn: nullFn, cursor: Cursor(file: file, line: line))
}

func beforeEach(fn: VoidBlk) {
  __current().beforeEach(fn)
}

func beforeAll(fn: VoidBlk) {
  __current().beforeAll(fn)
}

func xit(desc: String, fn: VoidBlk, file: String = __FILE__, line: Int = __LINE__) {
  it(desc, file: file, line: line)
}

func xit(desc: String, file: String = __FILE__, line: Int = __LINE__) {
  it(desc, file: file, line: line)
}

func define<T>(fn: @auto_closure () -> T) -> Void -> T {
  return __current().define(fn)
}

func __current() -> Specification {
  return Swiftest.context.current()
}

