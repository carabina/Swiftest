import Swiftest
class HooksSpec : SwiftestSuite {
  let spec = describe("hooks") {

    var (beforeEachCount, beforeAllCount) = (0, 0)

    describe("before each") {
      before() { beforeEachCount += 1 }

      it("runs a function before each example") {
        expect(beforeEachCount).to(.Equal(1))
      }

      it("increments the variable again") {
        expect(beforeEachCount).to(.Equal(2))
      }

      describe("nesting") {
        before(.each) { beforeEachCount += 1 }

        it("runs all the beforeEach blocks preceding it") {
          // this should increment TWICE (once for the preceding block)
          expect(beforeEachCount).to(.Equal(4))
        }
      }
    }

    describe("before all") {
      before(.all) { beforeAllCount += 1 }

      it("increments the variable") {
        expect(beforeAllCount).to(.Equal(1))
      }

      it("increments the variable only once") {
        expect(beforeAllCount).to(.Equal(1))
      }
    }

    it("only runs the beforeAll for the given suite") {
      expect(beforeAllCount).to(.Equal(0))
    }
  }
}
