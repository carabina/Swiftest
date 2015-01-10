public struct Hooks {
  
  public enum HookType {
    case Before
    case After
  }
  
  var hooks: Dictionary<HookType, [VoidBlk]> = [ .Before : [], .After  : [] ]
  
  public mutating func add(type: HookType, fn: VoidBlk) {
    hooks[type]?.append(fn)
  }
  
  public subscript(index: HookType) -> [VoidBlk] {
    get { return hooks[index] ?? [] }
    set { hooks[index] = newValue }
  }
}
