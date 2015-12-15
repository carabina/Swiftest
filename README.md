Swiftest
========

_A 100% pure Swift, Foundation-less, XCTest-less BDD framework._

## Installation

First: install Swiftest into your Swift project by declaring it as a dependency
in your Package.swift file as follows:

```swift
  .Package(url: "https://github.com/bppr/Swiftest.git", majorVersion: 0, minorVersion: 1)
```

Second, you'll have to create a spec target. Create a new target in your
Package.swift file, and give it a dependency on the module(s) you wish to test.

```swift
  targets: [
    Target(name: "Specs", dependencies: [.Target(name: "MyTargetToTest")])
  ]
```

Create a directory for your new Specs target: `mkdir -p Sources/Specs`, and add
your first test file:

```swift
import Swiftest

class MyFirstTest: Swiftest.Spec {
  let spec = describe("My First Test") {
    expect(true).to.equal(true)
  }
}
```

Now, to create our main test executable. Create a file called `main.swift` and
drop this into that file.

```swift
Swiftest.register([
  MyFirstSpec.self
])

Swiftest.run()

```

Now, build your project (`swift build`) and run your specs
(`./.build/debug/Specs`). You should see spec output!

Much more in the way of documentation and features coming soon including formatters,
customizable runners, extension, you name it!
