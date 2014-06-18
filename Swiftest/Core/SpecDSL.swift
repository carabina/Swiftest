func describe(target:String, fn:Swiftest.VoidFn, file:String = __FILE__, line:Int = __LINE__) -> Swiftest.Specification {
  return Swiftest.describe(target, fn: fn, file: file, line: line)
}

func example(subject:String, fn:Swiftest.VoidFn, file:String = __FILE__, line:Int = __LINE__) {
  Swiftest.context.current().example(subject, fn: fn, file: file, line: line)
}

func it(desc: String, fn:Swiftest.VoidFn, file:String = __FILE__, line:Int = __LINE__) {
  Swiftest.context.current().example(desc, fn: fn, file: file, line: line)
}
