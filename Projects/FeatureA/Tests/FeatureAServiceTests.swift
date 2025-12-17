import XCTest
@testable import FeatureA

final class FeatureAServiceTests: XCTestCase {
    var service: FeatureAService!

    override func setUp() {
        super.setUp()
        service = FeatureAService()
    }

    func testProcessData() {
        let result = service.processData(5)
        XCTAssertEqual(result, "FeatureA processed: 10")
    }

    func testGreetUser() {
        let result = service.greetUser("Alice")
        XCTAssertEqual(result, "FeatureA: Hello, Alice!")
    }
}
