import Swiftest
import Foundation

Swiftest.reporter.addListener(ConsoleListener())

exit(CInt(Swiftest.run()))
