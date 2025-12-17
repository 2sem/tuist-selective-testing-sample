import XCTest
@testable import FeatureB

final class FeatureBServiceTests: XCTestCase {
    var service: FeatureBService!

    override func setUp() {
        super.setUp()
        service = FeatureBService()
    }

    func testCalculate() {
        let result = service.calculate(3, 4)
        XCTAssertEqual(result, "FeatureB: sum=7, product=12")
    }

    func testWelcomeMessage() {
        let result = service.welcomeMessage(for: "Bob")
        XCTAssertEqual(result, "FeatureB welcomes you : Hello, Bob!")
    }
}
