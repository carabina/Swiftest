import Foundation

public class Timer {
  var startTime: NSDate?
  var endTime  : NSDate?
  
  init() {}
  
  func start() { self.startTime = NSDate() }
  func stop()  { self.endTime   = NSDate() }
  
  func time(fn: VoidBlk) {
    start()
    fn()
    stop()
  }
  
  public func report() -> NSTimeInterval {
    return endTime!.timeIntervalSinceDate(startTime!)
  }
  
  public func toString() -> String {
    return String(format: "%f", report())
  }
}