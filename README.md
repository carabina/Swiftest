Swiftest
=======
Swiftest is a *behavior driven development* testing library for Apple's
[Swift](https://developer.apple.com/swift/) language.

```swift
class SwiftestExample : SwiftestSpec {
  let spec = describe("Swiftest") {
    it("makes testing fun!") {
      expect(nil).to(.BeNil)
      expect(2 + 2).to(.Equal(4))
    }
  }
}
```

* [Documentation](doc/index.md)
* [Installation Instructions](doc/installation.md)

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
* example lifecycle hooks
* memoized values (similar to RSpec's `let`) (see [Definitions](doc/definitions.md))
* XCTest-based shell for easy use within Xcode
* separate Core library for multiple shell integrations (command-line shell coming soon)
* minimalist

### To-Do
* improve generic-ness of void closure matchers
* after-each
* command-line shell
* potentially separate expectation library into separate project
* cocoapods integration
