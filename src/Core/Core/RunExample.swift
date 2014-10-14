extension Swiftest {

  public static func runExample(ex: Example) {
    ex.timer.time() {
      Swiftest.reporter.exampleStarted(ex)
      ex.fn()
    }
    
    Swiftest.reporter.exampleFinished(ex)
  }
  
}