Swiftest
========

BDD-Style "spec" framework for Swift. Total work-in-progress. Don't use it yet,
because it's gonna change.

```swift
import SwiftestCore

describe() { (let spec) in
  spec.it("adds 1 + 1!") { (let test) in
    test.expect(1 + 1).toEqual(2)
  }

  spec.it("knows true from false!") { (let test) in
    test.expect(true).toBeTrue()
    test.expect(true).not().toBeFalse()
  }

  spec.testample("comparing letters of the alphabet!") { (let test) in
    test.expect("abc").toEqual("abc")
  }

  spec.it("knows what stuff is NOT other stuff!") { (let test) in
    test.expect(2 + 2).not().toEqual(5)
  }

  spec.example("arrays!") { (let test) in
    test.expect([1, 2, 3]).toEqual([1, 2, 3])
    test.expect([1, 2, 3]).toContain(1)
  }

  spec.example("dictionaries!") { (let test) in
    test.expect([ "key" : "val" ]).toEqual([ "key" : "val"])
    test.expect([ "key" : "val" ]).toHaveKey("key")
    test.expect([ "key" : "val" ]).toHaveValue("val")
  }

  spec.example("your own classes!") { (let test) in
    // Person is a class that implements Comparable
    var person1 = Person(name: "Bob")
    var person2 = Person(name: "Alice")

    test.expect(person1).not().toEqual(person2)
  }
}
```

## TODO:
* matchers. Lots of matchers.
* runner / XCode integration
* command-line runner?
