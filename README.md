Swiftest
========

Swiftest is a *behavior driven development* testing library for Apple's new-ish
[Swift](https://developer.apple.com/swift/) language.

*Swiftest is currently pre-1.0 and is undergoing changes. The current timeline
is to release 1.0 as Apple releases iOS 8 and the 1.0 version of Swift.*

The goal of Swiftest is to be extensible, fast, and for the core components to
be implemented in pure Swift with only Foundation.framework as a dependency.
Check out the
[Example Project](https://github.com/bppr/Swiftest/tree/master/src/Sample)
to see more.

Inspired heavily by
[RSpec](https://github.com/rspec/rspec), [Jasmine](http://jasmine.github.io/),
[OCDSpec2](https://github.com/OCDSpec/OCDSpec2) and
[Kiwi](https://github.com/kiwi-bdd/Kiwi)

### Features
* a clean, familiar specification DSL
* expectations for core types, and anything that implements `Equatable`
* fast, clear console reporter
* nested describe blocks
* memoized values (similar to RSpec's `let`)
* hooks for before-all / before-each example
* "void" closure matchers (more to come)
* target templates for iOS/OS X

### To Do
* Xcode error reports for failed specs
* more idiomatic Swift way of handling assertions (WIP)
* Time output (WIP)
* good async stuff (looking at examples from Jasmine 2 - "wait a second, then assert" isn't good enough)
* Obj-C Adapter (as separate project)
* CocoaPod installation (?)
* command-line interface (?)

### Example

```swift
import Swiftest

class SampleSpec : SwiftestSuite {
  let spec = describe("Swiftest") {
    it("has tons of expectations") {
      expect(true).not().toBe(false)

      expect(1 + 1).toEqual(2)

      expect([ "key" : "val" ]).toHaveKey("key")

      expect([1, 2, 3]).toContain(1, 3)
    }

    it("does nifty stuff with closures") {
      var a = 0

      expect({ a += 1 }).toChange(a).to(1)
      expect({ a += 1 }).toChange(a).from(1).to(2)
      expect({ a += 2 }).toChange(a).by(2)
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
class DefinitionExample : SwiftestSuite {
  let spec = describe("definitions") {
    var counter = define(Counter(number: 5))

    it("increments the number of the created Counter") {
      counter().increment()
      expect(counter().number).toEqual(6)
    }

    it("resets the object between each example") {
      expect(counter().number).toEqual(5)
    }
  }
}
```

### Installation
*Swiftest requires the Beta 6 release of Xcode 6. It is available
[here](https://developer.apple.com/xcode/downloads/) if you get a (free)
account.*

Clone the Swiftest project into your existing workspace's code directory.

run `cd Swiftest && ./etc/install_templates` to install the Swiftest templates.
Add `Swiftest/src/Swiftest/Swiftest.xcodeproj` to your workspace.

Add a new target to your project by clicking on the project's name in the
sidebar, then clicking the plus icon on the lower-left of the screen. Select
a Swiftest suite for either OS X or iOS. You have now configured a Swiftest
runner! Find the newly created target in your scheme menu, run (Cmd+R), and
you should see an empty test suite (0 examples, 0 failures).

If you are testing a Library or Framework, add it to your "Target Dependencies"
and "Link Binary With Libraries" lists in the "Build Phases" settings.

If you are testing an Application, add the application's files to the
"Compile Targets" list.

To start writing specs, add a `New File` to your newly created spec project,
select the Swiftest Spec template, and name the file as you wish. When you run
your specs again, you should see one failing spec.

## Happily accepting any and all feedback via GitHub issues
https://github.com/Swiftest/Swiftest
