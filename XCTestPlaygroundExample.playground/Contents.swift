//: A simple example on how to use `XCTestPlayground`.
//:
//: Note that you **need** to build the framework first using a 64-bit target (iPhone 5s and above) before you can use it here.

import XCTestPlayground

class TestCase: XCTestCase {
     func testAssertions() {
         XCTAssertEqual(1, 2)
         XCTAssertEqual([1, 2], [2, 3])
         XCTAssertGreaterThanOrEqual(1, 2)
         XCTAssertTrue(true)
     }
 }

TestCase()
