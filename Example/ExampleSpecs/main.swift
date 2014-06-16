import Swiftest

Swiftest.reporter.addListener(Swiftest.ConsoleListener())
Swiftest.register([
  PersonSpec(),SwiftestSpec()
])

Swiftest.run()
