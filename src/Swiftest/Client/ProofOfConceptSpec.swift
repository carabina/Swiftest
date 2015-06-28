import SwiftestCore

let BoolSpec = describe("true") {
  print("aw, cmon man")
  it("is supa true") {
    expect(true).to.equal(true)
  }
}

let NumberSpec = describe("numbers") {
  it("does expectations around numbers!") {
    expect(1 + 2 + 3).to.equal(6)
    expect(0).to.beLessThan(1)
  }
}
