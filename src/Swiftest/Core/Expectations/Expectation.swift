let defaultMessage = "expectation failed"

public class ExpectationResult : HasStatus {
	public var subjectText = ""
	public var assertions: [Assertion] = []
	public let cursor: Cursor

	public var status: Status {
		if assertions.isEmpty { return .Pending }

		for a in assertions {
			if a.call() == a.reverse { return .Fail }
		}

		return .Pass
	}

	public var msg : String {
		for a in assertions {
			if a.call() == a.reverse {
				let verb = a.reverse ? "not to" : "to"
				return "expected \(subjectText) \(verb) \(a.msg)"
			}
		}

		return defaultMessage
	}

	init(cursor: Cursor) { self.cursor = cursor }
	init(cursor: Cursor, subjectText: String) {
		self.cursor = cursor
		self.subjectText = subjectText
	}

	func assert(assertion: Assertion) {
		self.assertions.append(assertion)
	}
}

public protocol Expectable {
	var result : ExpectationResult { get }
}

public class Expectation<T, M:Matcher where M.SubjectType == T> : Expectable {
	let subject: T?
	public let result: ExpectationResult

	public var to : M {
		return M(subject: subject, callback: result.assert, reverse: false)
	}

	public var notTo : M {
		return M(subject: subject, callback: result.assert, reverse: true)
	}

	public init(subject: T?, cursor: Cursor = nullCursor) {
		self.subject = subject
		self.result = ExpectationResult(
			cursor: cursor,
			subjectText: "\(subject)"
		)
	}
}

public class ArrayExpectation<T:Equatable> : Expectable {
	let subject: [T]?
	public let result: ExpectationResult

	public var to : ArrayMatcher<T> {
		return ArrayMatcher(subject: subject, callback: result.assert, reverse: false)
	}

	public var notTo : ArrayMatcher<T> {
		return ArrayMatcher(subject: subject, callback: result.assert, reverse: true)
	}

	public init(subject: [T]?, cursor: Cursor = nullCursor) {
		self.subject = subject
		self.result = ExpectationResult(
			cursor: cursor,
			subjectText: "\(subject)"
		)
	}
}

public class DictionaryExpectation<K:Hashable, V:Equatable> : Expectable {
	let subject: [K : V]?
	public let result: ExpectationResult

	public var to : DictionaryMatcher<K, V> {
		return DictionaryMatcher(subject: subject, callback: result.assert, reverse: false)
	}

	public var notTo : DictionaryMatcher<K, V> {
		return DictionaryMatcher(subject: subject, callback: result.assert, reverse: true)
	}

	public init(subject: [K : V]?, cursor: Cursor = nullCursor) {
		self.subject = subject
		self.result = ExpectationResult(
			cursor: cursor,
			subjectText: "\(subject)"
		)
	}
}
