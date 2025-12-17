import XCTest
@testable import Core

final class CoreUtilityTests: XCTestCase {
    var utility: CoreUtility!

    override func setUp() {
        super.setUp()
        utility = CoreUtility()
    }

    func testGreet() {
        let result = utility.greet(name: "Tuist")
        XCTAssertEqual(result, "Hello, Tuist!")
    }

    func testAdd() {
        let result = utility.add(5, 3)
        XCTAssertEqual(result, 8)
    }

    func testMultiply() {
        let result = utility.multiply(4, 3)
        XCTAssertEqual(result, 12)
    }
}
