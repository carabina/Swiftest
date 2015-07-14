import SwiftestClient

describe("dictionaries") {
  let dict = [ "key" : "val" ]

  it("equals another dictionary") {
    expect(dict).to.equal([ "key" : "val" ])
  }

  it("does not equal another dictionary") {
    expect(dict).notTo.equal([ "another-key" : "val"])
  }

  it("has a given key") {
    expect(dict).to.haveKey("key")
  }

  it("does not have a given key") {
    expect(dict).notTo.haveKey("another-key")
  }

  it("has a given value") {
    expect(dict).to.haveValue("val")
  }

  it("does not have a given value") {
    expect(dict).notTo.haveValue("another-val")
  }

  it("contains a pair") {
    expect(dict).to.contain(["key" : "val"])
  }

  it("does not contain a pair") {
    expect(dict).notTo.contain(["different-key" : "val"])
  }

  it("is empty") {
    let emptyDict: Dictionary<String, String> = [ : ]
    expect(emptyDict).to.beEmpty()
  }

  it("is not empty") {
    expect(dict).notTo.beEmpty()
  }
}
