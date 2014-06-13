Swiftest
========

Experimental BDD "spec" framework for Apple's
[Swift](https://developer.apple.com/swift/) language.
Total work-in-progress. Goal is for this to be written in pure Swift, no
Objective-C here.

Inspired heavily by
[RSpec](https://github.com/rspec/rspec), [Jasmine](http://jasmine.github.io/),
[OCDSpec2](https://github.com/OCDSpec/OCDSpec2) and
[Kiwi](https://github.com/kiwi-bdd/Kiwi)

### What's done:
* specification DSL
* simple expectations and assertions for most types

### To do:
* console-based runner
* reporter protocols + XCode reporter
* setup/teardown
* XCode templates
* nested descriptions
* "example" project
* closure matchers (`expect(someAction()).toChange(someValue).to(otherValue)`)
* command-line interface?
* more + customizable matchers? (or just via extensions?)

### Example

```swift
import Swiftest

describe() { (let spec) in
  spec.it("adds 1 + 1!") {
    expect(1 + 1).toEqual(2)
  }

  spec.it("knows true from false!") {
    expect(true).toBeTrue()
    expect(true).not().toBeFalse()
  }

  spec.example("comparing letters of the alphabet!") {
    expect("abc").toEqual("abc")
  }

  spec.it("knows what stuff is NOT other stuff!") {
    expect(2 + 2).not().toEqual(5)
  }

  spec.example("arrays!") {
    expect([1, 2, 3]).toEqual([1, 2, 3])
    expect([1, 2, 3]).toContain(1)
  }

  spec.example("dictionaries!") {
    expect([ "key" : "val" ]).toEqual([ "key" : "val"])
    expect([ "key" : "val" ]).toHaveKey("key")
    expect([ "key" : "val" ]).toHaveValue("val")
  }

  spec.example("your own classes!") {
    // Person is a class that implements Comparable
    let person1 = Person(name: "Bob")
    let person2 = Person(name: "Alice")

    expect(person1).not().toEqual(person2)
  }
}
```
