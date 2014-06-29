Swiftest
========

Experimental BDD "spec" framework for Apple's
[Swift](https://developer.apple.com/swift/) language.
Total work-in-progress, but it is currently usable, if you check out the Example
project. The goal is for the core components to be written in pure Swift in a
cleanly extensible way.

Swiftest's runner is configurable with a simple closure, so the behavior can be
easily overridden, while still preserving the internal components. You can also
register listeners that will fire as the test suite executes to easily make
new formatters and/or reporters.

Inspired heavily by
[RSpec](https://github.com/rspec/rspec), [Jasmine](http://jasmine.github.io/),
[OCDSpec2](https://github.com/OCDSpec/OCDSpec2) and
[Kiwi](https://github.com/kiwi-bdd/Kiwi)

### What's done:
* specification DSL
* simple expectations and assertions for most types
* console reporter
* "example" project
* nested describe blocks
* auto-loading spec files
* "void" closure matchers

### To do:
* CocoaPod installation
* XCode target, project, and file templates
* XCode error/warn reporter integration
* setup / teardown / hooks
* command-line interface?

### Example

```swift
import Swiftest

// create a class that inherits from SwiftestSuite (it's just NSObject)
// and define the 'spec' member property of that class using `describe`
// be sure to use `let` and not `var` here!

class SampleSpec : SwiftestSuite {
  let spec = describe("Swiftest") {
    it("adds 1 + 1!") {
      expect(1 + 1).toEqual(2)
    }

    it("knows true from false!") {
      expect(true).toBeTrue()
      expect(true).not().toBeFalse()
    }

    example("comparing letters of the alphabet!") {
      expect("abc").toEqual("abc")
    }

    it("knows what stuff is NOT other stuff!") {
      expect(2 + 2).not().toEqual(5)
    }

    describe("arrays!") {
      example("special assertions for array types!") {
        expect([1, 2, 3]).toEqual([1, 2, 3])
        expect([1, 2, 3]).toContain(1)
      }
    }

    it("does nifty stuff with closures") {
      var a = 0

      expect({ a += 1 }).changes({ a }).to(1)
      expect({ a += 2 }).changes({ a }).by(2)
    }

    example("dictionaries have special assertions too!") {
      expect([ "key" : "val" ]).toEqual([ "key" : "val"])
      expect([ "key" : "val" ]).toHaveKey("key")
      expect([ "key" : "val" ]).toHaveValue("val")
    }

    example("your own classes!") {
      // Person is a class that implements Comparable
      let person1 = Person(name: "Bob")
      let person2 = Person(name: "Alice")

      expect(person1).not().toEqual(person2)
    }
  }
}
```

### Installation
NOTE: We're working on improving the installation process.

For now, clone this repository and add the Swiftest `xcodeproj` to your own
project. Create a command-line executable target and place the following in
`main.swift`:

```swift
import Swiftest

Swiftest.reporter.addListener(ConsoleListener())
Swiftest.run()
```

Then, configure the build to link with libSwiftest and
run the scheme (Cmd + R) with the command-line executable.
