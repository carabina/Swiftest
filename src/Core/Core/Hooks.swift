public enum HookType : String {
  case All = "All"
  case Each = "Each"
}

public class Hooks {
  init() {}
  
  var beforeHooks : Dictionary<HookType, [VoidBlk]> = [
    .Each : [],
    .All  : []
  ]
  
  public func ofType(hookType: HookType) -> [VoidBlk] {
    return beforeHooks[hookType] ?? []
  }
  
  public func add(hookType: HookType, hook: VoidBlk) {
    beforeHooks[hookType]?.append(hook)
  }
}
