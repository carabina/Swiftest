func describe(target:String, fn:Swiftest.VoidFn, file:String = __FILE__, line:Int = __LINE__) -> Swiftest.Specification {
  return Swiftest.describe(target, fn: fn, file: file, line: line)
}

func example(subject:String, fn:Swiftest.VoidFn, file:String = __FILE__, line:Int = __LINE__) {
  __current().example(subject, fn: fn, file: file, line: line)
}

func example(desc: String, file:String = __FILE__, line:Int = __LINE__) {
  __current().example(desc, fn: Swiftest.nullFn, file: file, line: line)
}

func it(desc: String, fn:Swiftest.VoidFn, file:String = __FILE__, line:Int = __LINE__) {
  __current().example(desc, fn: fn, file: file, line: line)
}

func it(desc: String, file:String = __FILE__, line:Int = __LINE__) {
  __current().example(desc, fn: Swiftest.nullFn, file: file, line: line)
}

func __current() -> Swiftest.Specification {
  return Swiftest.context.current()
}

