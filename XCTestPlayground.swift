// Playground Tests

import Foundation

public let defaultMessage = ""

/// Emits a test failure if the general `Boolean` expression passed
/// to it evaluates to `false`.
///
/// - Requires: This and all other XCTAssert* functions must be called from
///   within a test method, as passed to `XCTMain`.
///   Assertion failures that occur outside of a test method will *not* be
///   reported as failures.
///
/// - Parameter expression: A boolean test. If it evaluates to `false`, the
///   assertion fails and emits a test failure.
/// - Parameter message: An optional message to use in the failure if the
///   assertion fails. If no message is supplied a default message is used.
///
/// For example
///
/// ```swift
/// class TestCase: XCTestCase {
///     func testAssertions() {
///         XCTAssertEqual(1, 2)
///         XCTAssertEqual([1, 2], [2, 3])
///         XCTAssertGreaterThanOrEqual(1, 2)
///         XCTAssertTrue(true)
///     }
/// }
/// ```
///
public func XCTAssert(
    _ expression: @autoclosure () -> Bool,
    _ message: String = defaultMessage
    ) -> String {
    return returnTestResult(expression(), message: message)
}

public func XCTAssertEqual<T : Equatable>(
    _ expression1: @autoclosure () -> T?,
    _ expression2: @autoclosure () -> T?,
    _ message: String = defaultMessage
    ) -> String {
    return returnTestResult(
        expression1() == expression2(),
        message: "\(message) - expected: \(expression2() as Optional), actual: \(expression1() as Optional)")
}

public func XCTAssertEqual<T : Equatable>(
    _ expression1: @autoclosure () -> ArraySlice<T>,
    _ expression2: @autoclosure () -> ArraySlice<T>,
    _ message: String = defaultMessage
    ) -> String {
    return returnTestResult(
        expression1() == expression2(),
        message: "\(message) - expected: \(expression2()), actual: \(expression1())")
}

public func XCTAssertEqual<T : Equatable>(
    _ expression1: @autoclosure () -> ContiguousArray<T>,
    _ expression2: @autoclosure () -> ContiguousArray<T>,
    _ message: String = defaultMessage
    ) -> String {
    return returnTestResult(
        expression1() == expression2(),
        message: "\(message) - expected: \(expression2()), actual: \(expression1())")
}

public func XCTAssertEqual<T : Equatable>(
    _ expression1: @autoclosure () -> [T],
    _ expression2: @autoclosure () -> [T],
    _ message: String = defaultMessage
    ) -> String {
    return returnTestResult(
        expression1() == expression2(),
        message: "\(message) - expected: \(expression2()), actual: \(expression1())")
}

public func XCTAssertEqual<T, U : Equatable>(
    _ expression1: @autoclosure () -> [T : U],
    _ expression2: @autoclosure () -> [T : U],
    _ message: String = defaultMessage
    ) -> String {
    return returnTestResult(
        expression1() == expression2(),
        message: "\(message) - expected: \(expression2()), actual: \(expression1())")
}

public func XCTAssertFalse(
    _ expression: @autoclosure () -> Bool,
    _ message: String = defaultMessage
    ) -> String {
    return returnTestResult(!expression(), message: message)
}

public func XCTAssertGreaterThan<T : Comparable>(
    _ expression1: @autoclosure () -> T,
    _ expression2: @autoclosure () -> T,
    _ message: String = defaultMessage
    ) -> String {
    return returnTestResult(
        expression1() > expression2(),
        message: "\(message) - actual: \(expression1()) > \(expression2())")
}

public func XCTAssertGreaterThanOrEqual<T : Comparable>(
    _ expression1: @autoclosure () -> T,
    _ expression2: @autoclosure () -> T,
    _ message: String = defaultMessage
    ) -> String {
    return returnTestResult(
        expression1() >= expression2(),
        message: "\(message) - actual: \(expression1()) >= \(expression2())")
}

public func XCTAssertLessThan<T : Comparable>(
    _ expression1: @autoclosure () -> T,
    _ expression2: @autoclosure () -> T,
    _ message: String = defaultMessage
    ) -> String {
    return returnTestResult(
        expression1() < expression2(),
        message: "\(message) - actual: \(expression1()) < \(expression2())")
}

public func XCTAssertLessThanOrEqual<T : Comparable>(
    _ expression1: @autoclosure () -> T,
    _ expression2: @autoclosure () -> T,
    _ message: String = defaultMessage
    ) -> String {
    return returnTestResult(
        expression1() <= expression2(),
        message: "\(message) - actual: \(expression1()) <= \(expression2())")
}

public func XCTAssertNil(
    _ expression: @autoclosure () -> Any?,
    _ message: String = ""
    ) -> String {
    var result = true
    if let _ = expression() { result = false }
    return returnTestResult(
        result,
        message: "\(message) - expected: nil, actual: \(expression() as Optional)")
}

public func XCTAssertNotEqual<T : Equatable>(
    _ expression1: @autoclosure () -> T?,
    _ expression2: @autoclosure () -> T?,
    _ message: String = defaultMessage
    ) -> String {
    return returnTestResult(
        expression1() != expression2(),
        message: "\(message) - expected: \(expression1() as Optional) =! \(expression2() as Optional)")
}

public func XCTAssertNotEqual<T : Equatable>(
    _ expression1: @autoclosure () -> ContiguousArray<T>,
    _ expression2: @autoclosure () -> ContiguousArray<T>,
    _ message: String = defaultMessage
    ) -> String {
    return returnTestResult(
        expression1() != expression2(),
        message: "\(message) - expected: \(expression1()) != \(expression2())")
}

public func XCTAssertNotEqual<T : Equatable>(
    _ expression1: @autoclosure () -> ArraySlice<T>,
    _ expression2: @autoclosure () -> ArraySlice<T>,
    _ message: String = defaultMessage
    ) -> String {
    return returnTestResult(
        expression1() != expression2(),
        message: "\(message) - expected: \(expression1()) != \(expression2())")
}

public func XCTAssertNotEqual<T : Equatable>(
    _ expression1: @autoclosure () -> [T],
    _ expression2: @autoclosure () -> [T],
    _ message: String = defaultMessage
    ) -> String {
    return returnTestResult(
        expression1() != expression2(),
        message: "\(message) - expected: \(expression1()) != \(expression2())")
}

public func XCTAssertNotEqual<T, U : Equatable>(
    _ expression1: @autoclosure () -> [T : U],
    _ expression2: @autoclosure () -> [T : U],
    _ message: String = defaultMessage
    ) -> String {
    return returnTestResult(
        expression1() != expression2(),
        message: "\(message) - expected: \(expression1()) != \(expression2())")
}

public func XCTAssertNotNil(
    _ expression: @autoclosure () -> Any?,
    _ message: String = ""
    ) -> String {
    var result = false
    if let _ = expression() { result = true }
    return returnTestResult(result, message: message)
}

public func XCTAssertTrue(
    _ expression: @autoclosure () -> Bool,
    _ message: String = defaultMessage
    ) -> String {
    return returnTestResult(expression(), message: message)
}

public func XCTFail(_ message: String = "") -> String {
    return failMessage(message)
}

func returnTestResult(_ result: Bool, message: String) -> String {
    return result ? okMessage() : failMessage(message)
}

func okMessage() -> String { return "✅" }

func failMessage(_ message: String) -> String { return "❌" + message }

// This class was based on GitHub gist:
// https://gist.github.com/croath/a9358dac0530d91e9e2b

open class XCTestCase: NSObject {
    
    public override init(){
        super.init()
        self.runTestMethods()
    }

    open class func setUp() {}
    open func setUp() {}

    open class func tearDown() {}
    open func tearDown() {}
    
    override open var description: String { return "" }
    
    private func runTestMethods() {
        type(of:self).setUp()
        defer {
            type(of:self).tearDown()
        }
        var mc: CUnsignedInt = 0
        
        guard var mlist = class_copyMethodList(type(of:self).classForCoder(), &mc) else {
            return
        }
        (0 ..< mc).forEach { _ in
            let m = method_getName(mlist.pointee)
            if String(describing: m).hasPrefix("test") {
                self.setUp()
                self.performSelector(
                    onMainThread: m,
                    with: nil,
                    waitUntilDone: true)
                self.tearDown()
            }
            mlist = mlist.successor()
        }
    }
}
