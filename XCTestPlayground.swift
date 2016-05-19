// Playground Tests

import Foundation

let defaultMessage = ""

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
///
public func XCTAssert(
    @autoclosure expression: () -> BooleanType,
    _ message: String = defaultMessage
    ) -> String {
    return returnTestResult(expression(), message: message)
}

public func XCTAssertEqual<T : Equatable>(
    @autoclosure expression1: () -> T?,
    @autoclosure _ expression2: () -> T?,
    _ message: String = defaultMessage
    ) -> String {
    return returnTestResult(
        expression1() == expression2(),
        message: "\(message) - expected: \(expression2()), actual: \(expression1())")
}

public func XCTAssertEqual<T : Equatable>(
    @autoclosure expression1: () -> ArraySlice<T>,
    @autoclosure _ expression2: () -> ArraySlice<T>,
    _ message: String = defaultMessage
    ) -> String {
    return returnTestResult(
        expression1() == expression2(),
        message: "\(message) - expected: \(expression2()), actual: \(expression1())")
}

public func XCTAssertEqual<T : Equatable>(
    @autoclosure expression1: () -> ContiguousArray<T>,
    @autoclosure _ expression2: () -> ContiguousArray<T>,
    _ message: String = defaultMessage
    ) -> String {
    return returnTestResult(
        expression1() == expression2(),
        message: "\(message) - expected: \(expression2()), actual: \(expression1())")
}

public func XCTAssertEqual<T : Equatable>(
    @autoclosure expression1: () -> [T],
    @autoclosure _ expression2: () -> [T],
    _ message: String = defaultMessage
    ) -> String {
    return returnTestResult(
        expression1() == expression2(),
        message: "\(message) - expected: \(expression2()), actual: \(expression1())")
}

public func XCTAssertEqual<T, U : Equatable>(
    @autoclosure expression1: () -> [T : U],
    @autoclosure _ expression2: () -> [T : U],
    _ message: String = defaultMessage
    ) -> String {
    return returnTestResult(
        expression1() == expression2(),
        message: "\(message) - expected: \(expression2()), actual: \(expression1())")
}

public func XCTAssertFalse(
    @autoclosure expression: () -> BooleanType,
    _ message: String = defaultMessage
    ) -> String {
    return returnTestResult(!expression().boolValue, message: message)
}

public func XCTAssertGreaterThan<T : Comparable>(
    @autoclosure expression1: () -> T,
    @autoclosure _ expression2: () -> T,
    _ message: String = defaultMessage
    ) -> String {
    return returnTestResult(
        expression1() > expression2(),
        message: "\(message) - actual: \(expression1()) > \(expression2())")
}

public func XCTAssertGreaterThanOrEqual<T : Comparable>(
    @autoclosure expression1: () -> T,
    @autoclosure _ expression2: () -> T,
    _ message: String = defaultMessage
    ) -> String {
    return returnTestResult(
        expression1() >= expression2(),
        message: "\(message) - actual: \(expression1()) >= \(expression2())")
}

public func XCTAssertLessThan<T : Comparable>(
    @autoclosure expression1: () -> T,
    @autoclosure _ expression2: () -> T,
    _ message: String = defaultMessage
    ) -> String {
    return returnTestResult(
        expression1() < expression2(),
        message: "\(message) - actual: \(expression1()) < \(expression2())")
}

public func XCTAssertLessThanOrEqual<T : Comparable>(
    @autoclosure expression1: () -> T,
    @autoclosure _ expression2: () -> T,
    _ message: String = defaultMessage
    ) -> String {
    return returnTestResult(
        expression1() <= expression2(),
        message: "\(message) - actual: \(expression1()) <= \(expression2())")
}

public func XCTAssertNil(
    @autoclosure expression: () -> Any?,
    _ message: String = ""
    ) -> String {
    var result = true
    if let _ = expression() { result = false }
    return returnTestResult(
        result,
        message: "\(message) - expected: nil, actual: \(expression())")
}

public func XCTAssertNotEqual<T : Equatable>(
    @autoclosure expression1: () -> T?,
    @autoclosure _ expression2: () -> T?,
    _ message: String = defaultMessage
    ) -> String {
    return returnTestResult(
        expression1() != expression2(),
        message: "\(message) - expected: \(expression1()) =! \(expression2())")
}

public func XCTAssertNotEqual<T : Equatable>(
    @autoclosure expression1: () -> ContiguousArray<T>,
    @autoclosure _ expression2: () -> ContiguousArray<T>,
    _ message: String = defaultMessage
    ) -> String {
    return returnTestResult(
        expression1() != expression2(),
        message: "\(message) - expected: \(expression1()) != \(expression2())")
}

public func XCTAssertNotEqual<T : Equatable>(
    @autoclosure expression1: () -> ArraySlice<T>,
    @autoclosure _ expression2: () -> ArraySlice<T>,
    _ message: String = defaultMessage
    ) -> String {
    return returnTestResult(
        expression1() != expression2(),
        message: "\(message) - expected: \(expression1()) != \(expression2())")
}

public func XCTAssertNotEqual<T : Equatable>(
    @autoclosure expression1: () -> [T],
    @autoclosure _ expression2: () -> [T],
    _ message: String = defaultMessage
    ) -> String {
    return returnTestResult(
        expression1() != expression2(),
        message: "\(message) - expected: \(expression1()) != \(expression2())")
}

public func XCTAssertNotEqual<T, U : Equatable>(
    @autoclosure expression1: () -> [T : U],
    @autoclosure _ expression2: () -> [T : U],
    _ message: String = defaultMessage
    ) -> String {
    return returnTestResult(
        expression1() != expression2(),
        message: "\(message) - expected: \(expression1()) != \(expression2())")
}

public func XCTAssertNotNil(
    @autoclosure expression: () -> Any?,
    _ message: String = ""
    ) -> String {
    var result = false
    if let _ = expression() { result = true }
    return returnTestResult(result, message: message)
}

public func XCTAssertTrue(
    @autoclosure expression: () -> BooleanType,
    _ message: String = defaultMessage
    ) -> String {
    return returnTestResult(expression(), message: message)
}

public func XCTFail(message: String = "") -> String {
    return failMessage(message)
}

func returnTestResult(result: BooleanType, message: String) -> String {
    return result.boolValue ? okMessage() : failMessage(message)
}

func okMessage() -> String { return "✅" }

func failMessage(message: String) -> String { return "❌" + message }

// This class was based on GitHub gist:
// https://gist.github.com/croath/a9358dac0530d91e9e2b

public class XCTestCase: NSObject {
    
    public override init(){
        super.init()
        self.runTestMethods()
    }

    public class func setUp() {}
    public func setUp() {}

    public class func tearDown() {}
    public func tearDown() {}
    
    override public var description: String { return "" }
    
    private func runTestMethods(){
        self.dynamicType.setUp()
        var mc: CUnsignedInt = 0
        var mlist: UnsafeMutablePointer<Method> =
            class_copyMethodList(self.dynamicType.classForCoder(), &mc);
        (0 ..< mc).forEach { _ in
            let m = method_getName(mlist.memory)
            if String(m).hasPrefix("test") {
                self.setUp()
                self.performSelectorOnMainThread(
                    m,
                    withObject: nil,
                    waitUntilDone: true)
                self.tearDown()
            }
            mlist = mlist.successor()
        }
        self.dynamicType.tearDown()
    }
}
