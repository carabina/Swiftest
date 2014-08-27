import Foundation

public class Timer {
  var startTime: NSDate?
  var endTime: NSDate?
  
  init() {}

  func start() { self.startTime = NSDate() }
  
  func stop() { self.endTime = NSDate() }
  
  public func report() -> NSTimeInterval {
    return endTime!.timeIntervalSinceDate(startTime!)
  }
  
  public func toString() -> String {
    return NSString(format: "%f", report())
  }
}
