public class ArrayMatcher<T:Equatable> : Matcher {
	public typealias SubjectType = [T]

	let subject: [T]?
	let core: MatcherCore

	required public init(subject: [T]?, callback: AssertionBlock, reverse: Bool) {
		self.subject = subject
		self.core = MatcherCore(callback: callback, reverse: reverse)
	}

	public func beEmpty() {
		core.assert(
			fn: { self.subject?.isEmpty ?? false },
			msg: "\(subject) to be empty")
	}

	public func equal(expected: [T]) {
		core.assert(fn: { self.subject! == expected }, msg: "equal \(expected)")
	}

	public func contain(expected: T...) {
		for ex in expected {
			self._contain(ex)
		}
	}

	func _contain(expected: T) {
		core.assert(
			fn: { self.subject?.indexOf(expected) != nil },
			msg: "contain \(expected)"
		)
	}
}
