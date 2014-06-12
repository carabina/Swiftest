Swiftest
========

BDD-Style "spec" framework for Swift. Total work-in-progress. Don't use it yet,
because it's gonna change.

### TODO:
* reporter protocols + XCode reporter / integration
* "example" project
* more matchers
* customizable matchers? (or just via extensions?)
* command-line runner?

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

