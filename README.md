Swiftest
========

Experimental BDD "spec" framework for Apple's
[Swift](https://developer.apple.com/swift/) language.
Total work-in-progress, but it is currently usable, if you check out the Example
project. Goal is for this to be written in pure Swift.

Inspired heavily by
[RSpec](https://github.com/rspec/rspec), [Jasmine](http://jasmine.github.io/),
[OCDSpec2](https://github.com/OCDSpec/OCDSpec2) and
[Kiwi](https://github.com/kiwi-bdd/Kiwi)

### What's done:
* specification DSL
* simple expectations and assertions for most types
* console reporter
* "example" project

### To do:
* XCode reporter
* setup / teardown
* XCode templates
* nested descriptions
* closure matchers (`expect(someAction()).toChange(someValue).to(otherValue)`)
* command-line interface?
* more + customizable matchers? (or just via extensions?)

### Example

```swift
// SwiftestSpec.swift
import Swiftest

// create a class that implements the SwiftestSuite protocol
// and define the 'spec' member property of that class using `describe`

class SwiftestSpec : SwiftestSuite {
  var spec = describe("Swiftest") {
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

    example("arrays!") {
      expect([1, 2, 3]).toEqual([1, 2, 3])
      expect([1, 2, 3]).toContain(1)
    }

    example("dictionaries!") {
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
