# Hooks
Hooks allow you to run some shared setup code before each example is run.

```swift
class HooksSpec: SwiftestSpec {
  let spec = describe("hooks") {

    var eachCount = 0

    describe("each") {
      before() { eachCount += 1 }

      it("gets run before each example") {
        expect(eachCount).to(.Equal(1))
      }

      it("has run twice for the second example") {
        expect(eachCount).to(.Equal(2))
      }

      describe("nested hooks") {
        before() { eachCount += 1 }

        it("runs the blocks of the parent specs as well as nested") {
          expect(eachCount).to(.Equal(4))
        }
      }

// ...
```
