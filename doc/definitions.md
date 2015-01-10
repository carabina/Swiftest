# Definitions
Definitions are a simple way to define lazily-evaluated functions to
encapsulate values your specs may need, similar to RSpecs `let`. The values
are memoized in each example, and reset after each example is run.

This feature is useful if each spec performs a different mutation on a 'default'
object.

Compare this to declaring an optional value and then setting that value in a
`before` block and unwrapping it explicity before use.

```swift
class DefinitionExample : SwiftestSpec {
  let spec = describe("definitions") {
    var counter = define() { Counter(number: 5) }

    it("increments the number of the created Counter") {
      counter().increment()
      expect(counter().number).to(.Equal(6))
    }

    it("resets the object between each example") {
      expect(counter().number).to(.Equal(5))
    }
  }
}
```
