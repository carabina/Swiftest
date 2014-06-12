Swiftest
========

BDD-Style "spec" framework for Swift. Total work-in-progress. Don't use it yet,
because it's gonna change.

```swift
Swiftest.describe() { (let spec) in
  spec.example("1 + 1") { (let ex) in
    ex.expect(1 + 1).toEqual(2)
  }

  spec.example("the alphabet") { (let ex) in
    ex.expect("abc").toEqual("abc")
  }

  spec.example("not stuff") { (let ex) in
    ex.expect(2 + 2).not().toEqual(5)
  }

  spec.example("arrays!") { (let ex) in
    ex.expect([1, 2, 3]).toEqual([1, 2, 3])
  }

  spec.example("dictionaries!") { (let ex) in
    ex.expect([ "key" : "val" ]).toEqual([ "key" : "val"])
  }

  spec.example("user defined classes") { (let ex) in
    // Person is a class that implements Comparable
    var person1 = Person(name: "Bob")
    var person2 = Person(name: "Alice")

    ex.expect(person1).not().toEqual(person2)
  }
}
```

## TODO:
* matchers. Lots of matchers.
* runner / XCode integration
* command-line runner?
