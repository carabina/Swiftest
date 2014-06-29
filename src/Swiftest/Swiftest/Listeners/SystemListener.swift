var _failedCount = 0

class SystemListener : BaseListener {

  var onFinish : VoidBlk = { assert(_failedCount == 0, "failed specs") }

  override func expectationFailed(expectation: BaseExpectation) {
    _failedCount++
  }

  override func suiteFinished() {
    self.onFinish()
  }

}