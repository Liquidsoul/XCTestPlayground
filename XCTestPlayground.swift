import Foundation

let defaultMessage = ""

public func XCTAssert(@autoclosure expression: () -> BooleanType, _ message: String = defaultMessage) -> String {
    return returnTestResult(expression(), message: message)
}

public func XCTAssertEqual<T : Equatable>(@autoclosure expression1: () -> T?, @autoclosure _ expression2: () -> T?, _ message: String = defaultMessage) -> String {
    return returnTestResult(expression1() == expression2(), message: "\(message) - expected: \(expression2()), actual: \(expression1())")
}

public func XCTAssertEqual<T : Equatable>(@autoclosure expression1: () -> ArraySlice<T>, @autoclosure _ expression2: () -> ArraySlice<T>, _ message: String = defaultMessage) -> String {
    return returnTestResult(expression1() == expression2(), message: "\(message) - expected: \(expression2()), actual: \(expression1())")
}

public func XCTAssertEqual<T : Equatable>(@autoclosure expression1: () -> ContiguousArray<T>, @autoclosure _ expression2: () -> ContiguousArray<T>, _ message: String = defaultMessage) -> String {
    return returnTestResult(expression1() == expression2(), message: "\(message) - expected: \(expression2()), actual: \(expression1())")
}

public func XCTAssertEqual<T : Equatable>(@autoclosure expression1: () -> [T], @autoclosure _ expression2: () -> [T], _ message: String = defaultMessage) -> String {
    return returnTestResult(expression1() == expression2(), message: "\(message) - expected: \(expression2()), actual: \(expression1())")
}

public func XCTAssertEqual<T, U : Equatable>(@autoclosure expression1: () -> [T : U], @autoclosure _ expression2: () -> [T : U], _ message: String = defaultMessage) -> String {
    return returnTestResult(expression1() == expression2(), message: "\(message) - expected: \(expression2()), actual: \(expression1())")
}

public func XCTAssertFalse(@autoclosure expression: () -> BooleanType, _ message: String = defaultMessage) -> String {
    return returnTestResult(!expression().boolValue, message: message)
}

public func XCTAssertGreaterThan<T : Comparable>(@autoclosure expression1: () -> T, @autoclosure _ expression2: () -> T, _ message: String = defaultMessage) -> String {
    return returnTestResult(expression1() > expression2(), message: "\(message) - actual: \(expression1()) > \(expression2())")
}

public func XCTAssertGreaterThanOrEqual<T : Comparable>(@autoclosure expression1: () -> T, @autoclosure _ expression2: () -> T, _ message: String = defaultMessage) -> String {
    return returnTestResult(expression1() >= expression2(), message: "\(message) - actual: \(expression1()) >= \(expression2())")
}

public func XCTAssertLessThan<T : Comparable>(@autoclosure expression1: () -> T, @autoclosure _ expression2: () -> T, _ message: String = defaultMessage) -> String {
    return returnTestResult(expression1() < expression2(), message: "\(message) - actual: \(expression1()) < \(expression2())")
}

public func XCTAssertLessThanOrEqual<T : Comparable>(@autoclosure expression1: () -> T, @autoclosure _ expression2: () -> T, _ message: String = defaultMessage) -> String {
    return returnTestResult(expression1() <= expression2(), message: "\(message) - actual: \(expression1()) <= \(expression2())")
}

public func XCTAssertNil(@autoclosure expression: () -> Any?, _ message: String = "") -> String {
    var result = true
    if let _ = expression() {
        result = false
    }
    return returnTestResult(result, message: "\(message) - expected: nil, actual: \(expression())")
}

public func XCTAssertNotEqual<T : Equatable>(@autoclosure expression1: () -> T?, @autoclosure _ expression2: () -> T?, _ message: String = defaultMessage) -> String {
    return returnTestResult(expression1() != expression2(), message: "\(message) - expected: \(expression1()) =! \(expression2())")
}

public func XCTAssertNotEqual<T : Equatable>(@autoclosure expression1: () -> ContiguousArray<T>, @autoclosure _ expression2: () -> ContiguousArray<T>, _ message: String = defaultMessage) -> String {
    return returnTestResult(expression1() != expression2(), message: "\(message) - expected: \(expression1()) != \(expression2())")
}

public func XCTAssertNotEqual<T : Equatable>(@autoclosure expression1: () -> ArraySlice<T>, @autoclosure _ expression2: () -> ArraySlice<T>, _ message: String = defaultMessage) -> String {
    return returnTestResult(expression1() != expression2(), message: "\(message) - expected: \(expression1()) != \(expression2())")
}

public func XCTAssertNotEqual<T : Equatable>(@autoclosure expression1: () -> [T], @autoclosure _ expression2: () -> [T], _ message: String = defaultMessage) -> String {
    return returnTestResult(expression1() != expression2(), message: "\(message) - expected: \(expression1()) != \(expression2())")
}

public func XCTAssertNotEqual<T, U : Equatable>(@autoclosure expression1: () -> [T : U], @autoclosure _ expression2: () -> [T : U], _ message: String = defaultMessage) -> String {
    return returnTestResult(expression1() != expression2(), message: "\(message) - expected: \(expression1()) != \(expression2())")
}

public func XCTAssertNotNil(@autoclosure expression: () -> Any?, _ message: String = "") -> String {
    var result = false
    if let _ = expression() {
        result = true
    }
    return returnTestResult(result, message: message)
}

public func XCTAssertTrue(@autoclosure expression: () -> BooleanType, _ message: String = defaultMessage) -> String {
    return returnTestResult(expression(), message: message)
}

public func XCTFail(message: String = "") -> String {
    return failMessage(message)
}

func returnTestResult(result: BooleanType, message: String) -> String {
    if result {
        return okMessage()
    }
    return failMessage(message)
}

func okMessage() -> String {
    return "✅"
}

func failMessage(message: String) -> String {
    return "❌" + message
}

// This class was based on GitHub gist: https://gist.github.com/croath/a9358dac0530d91e9e2b

public class XCTestCase: NSObject {
    
    public override init(){
        super.init()
        self.runTestMethods()
    }

    public class func setUp() {}
    public func setUp() {}

    public class func tearDown() {}
    public func tearDown() {}
    
    private func runTestMethods(){
        self.dynamicType.setUp()
        var mc: CUnsignedInt = 0
        var mlist: UnsafeMutablePointer<Method> = class_copyMethodList(self.dynamicType.classForCoder(), &mc);
        for var i: CUnsignedInt = 0; i < mc; i++ {
            let m = method_getName(mlist.memory)
            if String(m).hasPrefix("test") {
                setup()
                self.performSelectorOnMainThread(m, withObject: nil, waitUntilDone: true)
            }
            mlist = mlist.successor()
        }
        self.dynamicType.tearDown()
    }
    override public var description: String {
        return ""
    }
}
