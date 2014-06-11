import Foundation

typealias DescribeBlk = ((Specification) -> Void)

class Spec {
  class func describe(target : String, blk : DescribeBlk) -> Specification {
    let spec = Specification(name: target)
    blk(spec)
    return spec
  }
}