# Basic Usage

## Specifications / `describe`

Create a `Specification` by adding a new class to your test project that inherits
from `SwiftestSpec`. In order to add `Example`s to your spec, use the `describe`
function.

```swift
class Example : SwiftestSpec {
  let spec = describe("example") {
  }
}
```

You can nest `Specification`s within one another to create shared setup and limit
scope.

```swift
class PersonSpec : SwiftestSpec {
  let spec = describe("Person") {
    describe("name") {
      let person = Person(name: "Bob")

      it("has a name") {
        expect(person.name).to(.Equal("Bob"))
      }
    }
  }
}
```

## Examples / `it`

You can add `Example`s to a `Specification` by using the `it` function.

```swift
class Example : SwiftestSpec {
  let spec = describe("example") {
    it("can tell true from false") {
      expect(true).to(.BeTrue)
    }
  }
}
```
