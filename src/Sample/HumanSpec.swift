import Sample
import Swiftest

class HumanSpec : SwiftestSuite {
  let spec = describe("Human") {
    
    it("is equal if they have the same name") {
      let human1 = Human(name: "Bob")
      let human2 = Human(name: "Bob")
      
      expect(human1).to(.Equal(human2))
    }
  
  }
}