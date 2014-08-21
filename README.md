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
* "void" closure matchers (more to come)
* beforeEach / beforeAll hooks
* Mac OSX target template
* File template
* iPhone target

### To Do (before any kind of "version")
* more idiomatic Swift way of handling assertions (WIP)
* Time outputs test suite (WIP)
* good async stuff (looking at examples from Jasmine 2 - "wait a second, then assert" isn't good enough)
* Obj-C Adapter
* CocoaPod installation (?)
* command-line interface (?)

### Example

```swift
import Swiftest

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
      expect("abc").toContain("b")
      expect("abc").toStartWith("a")
      expect("abc").toEndWith("c")
    }

    it("knows what stuff is NOT other stuff!") {
      expect(2 + 2).not().toEqual(5)
    }

    describe("arrays!") {
      example("special assertions for array types!") {
        expect([1, 2, 3]).toEqual([1, 2, 3])

        expect([1, 2, 3]).toContain(1)
        expect([1, 2, 3]).toContain(1, 3)
      }
    }

    it("does nifty stuff with closures") {
      var a = 0

      expect({ a += 1 }).toChange(a).to(1)
      expect({ a += 1 }).toChange(a).from(1).to(2)
      expect({ a += 2 }).toChange(a).by(2)
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

### Definitions
Definitions are a simple way to define lazily-evaluated functions to
encapsulate values your specs may need, similar to RSpecs `let`. The values
are memoized in each example, and reset after each example is run.

Compare this to declaring an optional value and then setting that value in a
`beforeEach` block and unwrapping it explicity before use.

```swift
class DefinitionExample : SwiftestSuite {
  let spec = describe("definitions") {
    var subject = define(Counter(number: 5))

    it("increments the number of the created Counter") {
      subject().increment()
      expect(subject().number).toEqual(6)
    }

    it("resets the object between each example") {
      expect(subject().number).toEqual(5)
    }
  }
}
```

### Installation
*Swiftest requires Xcode6 beta 6*
Clone the Swiftest project into your app's directory.

run `cd Swiftest && ./etc/install_templates` to install the Swiftest templates.
Add `Swiftest/src/Swiftest/Swiftest.xcodeproj` to your app.

Add a new target to your project by clicking on the project's name in the
sidebar, then clicking the plus icon on the lower-left of the screen. Select
a Swiftest suite for either OS X or iOS. You have now configured a Swiftest
runner! Find the newly created target in your scheme menu, run (Cmd+R), and
you should see an empty test suite (0 examples, 0 failures).

To start writing specs, add a `New File` to your newly created spec project, 
select the Swiftest Spec template, and name the file as you wish. When you run
your specs again, you should see one failing spec.

Issues? Don't get a tissue, file an issue!
