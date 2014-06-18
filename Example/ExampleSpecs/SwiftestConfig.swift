import Swiftest
class SwiftestConfig {
  var suites = Swiftest.register([
    PersonSpec(),SwiftestSpec()
  ])
}
