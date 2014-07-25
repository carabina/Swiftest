enum RunnableType : String {
  case Example = "Example"
  case Specification = "Specification"
}

public enum HookType : String {
  case each = "each"
  case all = "all"
}

extension Specification {
  class Context {
    var children    : [Runnable] = []
    var definitions : [Resettable] = []
    var onExample   : Example = nullExample
    var beforeHooks : Dictionary<HookType, [VoidBlk]> = [
      .each : [],
      .all  : []
    ]

    func add(child: Runnable) {
      children.append(child)
    }

    func addHook(hook: HookType, fn: VoidBlk) {
      if var result = beforeHooks[hook] {
        beforeHooks[hook] = result + [fn]
      }
    }

    func hooksFor(hook: HookType) -> [VoidBlk] {
      if let hooks = beforeHooks[hook] { return hooks }
      return []
    }

    func withExample(ex: Example, fn: VoidBlk) {
      onExample = ex
      fn()
      onExample = nullExample
    }

    func examples() -> [Example] {
      return children.filter({ c in c.ofType == .Example })
        .map({ c in c as Example })
    }

    func specs() -> [Specification] {
      return children.filter({ c in c.ofType == .Specification })
        .map({ c in c as Specification })
    }

    func sort() {
      children.sort({ (r1, r2) in r1.ofType.toRaw() < r2.ofType.toRaw() })
    }

  }
}
