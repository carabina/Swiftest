Swiftest
=======

Swiftest is a *behavior driven development* testing library for Apple's
[Swift](https://developer.apple.com/swift/) language.

* [Installing](#Installing)

### Features
* a clean, familiar specification DSL: `describe`, `it`, etc.
* `expect` style assertion DSL with lots of expectations:
  * `Equatable`: equal, nil
  * `Comparable`: equal, nil, greater, less, greater or equal, less or equal, between
  * `String`: equal, start with, end with, contain
  * `Array`: equal, empty, contain, contain many
  * `Dictionary`: equal, empty, have key, have value, contain sub-dictionary
  * `Closures`: change to, change from, change by
* nested example groups
* memoized values (similar to RSpec's `let`) (see [Definitions](#Definitions))
* hooks for before-each example
* XCTest-based shell for easy use within XCode
* separate Core library for multiple shell integrations (command-line shell coming soon)
* minimalist, functional-style implementation

### To-Do
* improve generic-ness of void closure matchers
* after-each
* command-line shell
* potentially separate expectation library into separate project
* cocoapods integration

### Example
```swift
import SwiftestXC

class ExampleSpec : SwiftestSpec {
  let spec = describe("Swiftest") {
    it("has tons of expectations") {
      expect(true).notTo(.Be(false))

      expect(1 + 1).to(.Equal(2))

      expect([ "key" : "val" ]).to(.HaveKey("key"))

      expect([1, 2, 3]).to(.Contain(1, 3))
    }

    it("does nifty stuff with closures") {
      var a = 0

      expect({ a += 1 }).to(.Change(a)).to(1)
      expect({ a += 1 }).to(.Change(a)).from(1).to(2)
      expect({ a += 2 }).to(.Change(a)).by(2)
    }
  }
}
```

### Definitions
Definitions are a simple way to define lazily-evaluated functions to
encapsulate values your specs may need, similar to RSpecs `let`. The values
are memoized in each example, and reset after each example is run.

Compare this to declaring an optional value and then setting that value in a
`beforeEach` block and unwrapping it explicity before use.

```swift
class DefinitionExample : SwiftestSpec {
  let spec = describe("definitions") {
    var counter = define() { Counter(number: 5) }

    it("increments the number of the created Counter") {
      counter().increment()
      expect(counter().number).to(.Equal(6))
    }

    it("resets the object between each example") {
      expect(counter().number).to(.Equal(5))
    }
  }
}
```

### Installation
#### SwiftestXC

*Swiftest requires a release of Xcode version 6.1 or higher.*

1. Clone the Swiftest project into your existing workspace's code directory.
2. Add `SwiftestXC.xcodeproj` to your workspace.
3. Select your test target and add `SwiftestCore.framework` and
  `SwiftestXC.framework` in the "Link Binary With Libraries" under
  "Build Phases"

4. Add a spec file. Inherit from `SwiftestSpec`, add a `describe` block
  and start writing specs!

## Happily accepting any and all feedback via GitHub issues
https://github.com/Swiftest/Swiftest
