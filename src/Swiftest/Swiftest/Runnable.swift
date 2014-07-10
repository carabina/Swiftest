protocol Runnable {
  func run()
  func getStatus() -> Status
  var ofType : String { get }
}

