protocol Runnable {
  func run()
  func getStatus() -> ExampleStatus
  var ofType : String { get }
}