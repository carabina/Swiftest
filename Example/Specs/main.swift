import Swiftest

Swiftest.register(SwiftestSpec())

Swiftest.reporter.addListener(Swiftest.ConsoleListener())
Swiftest.run()