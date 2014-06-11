import Foundation

typealias DescribeBlk = ((Specification) -> Void)

class Swiftest {
  class func describe(target : String, blk : DescribeBlk) -> Specification {
    let spec = Specification(name: target)
    blk(spec)
    return spec
  }
}