Swiftest
========

BDD-Style "spec" framework for Swift. Total work-in-progress.

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
}
```

## TODO:
* matchers. Lots of matchers.
* runner / XCode integration
* command-line runner?
