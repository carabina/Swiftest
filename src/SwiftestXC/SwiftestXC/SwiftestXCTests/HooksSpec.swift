import SwiftestXC

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

        it("run the blocks of the parent specs as well as nested") {
          expect(eachCount).to(.Equal(4))
        }
      }
      
      describe("other nested hooks") {
        it("only runs the parent specs if it doesn't have a hook defined") {
          expect(eachCount).to(.Equal(5))
        }
      }
    }
  }
}
