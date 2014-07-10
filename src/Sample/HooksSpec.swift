import Swiftest
class HooksSpec : SwiftestSuite {
  let spec = describe("hooks") {
    var (beforeEachCount, beforeAllCount) = (0, 0)

    describe("before each") {
      beforeEach() { beforeEachCount += 1 }

      it("runs a function before each example") {
        expect(beforeEachCount).toEqual(1)
      }

      it("increments the variable again") {
        expect(beforeEachCount).toEqual(2)
      }

      describe("nesting") {
        beforeEach() { beforeEachCount += 1 }

        it("runs all the beforeEach blocks preceding it") {
          expect(beforeEachCount).toEqual(3)
        }
      }
    }

    describe("before all") {
      beforeAll() { beforeAllCount += 1 }

      it("increments the variable") {
        expect(beforeAllCount).toEqual(1)
      }

      it("increments the variable only once") {
        expect(beforeAllCount).toEqual(1)
      }
    }

    it("only runs the beforeAll for the given suite") {
      expect(beforeAllCount).toEqual(0)
    }
  }
}
