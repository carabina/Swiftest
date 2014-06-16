import Swiftest
import Example

class PersonSpec : SwiftestSuite {
  let spec = describe("Person") {
    
    let person = Person(name : "name", age : 42)
    
    it("has a name") {
      expect(person.name).toEqual("name")
    }
    
    it("has an age") {
      expect(person.age).toEqual(42)
    }

    it("gets to be pending")
    
    it("ASPLODES") {
      expect(person.name).toEqual("a-different-name")
    }
    
  }
}
