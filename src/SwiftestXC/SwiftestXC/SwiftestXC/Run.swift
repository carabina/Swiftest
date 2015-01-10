import SwiftestCore

struct Run {
  static func blocksFor(spec: Specification) -> [Bridge.Result] {
    return spec.children.map(blocksFor)
      .reduce(spec.examples.map(Bridge.Result.build(spec)), +)
  }
}

