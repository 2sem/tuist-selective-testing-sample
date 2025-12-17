import XCTest
@testable import FeatureA
@testable import FeatureB

final class AppTests: XCTestCase {
    func testFeatureAIntegration() {
        let service = FeatureAService()
        let result = service.processData(10)
        XCTAssertEqual(result, "FeatureA processed: 20")
    }

    func testFeatureBIntegration() {
        let service = FeatureBService()
        let result = service.calculate(5, 6)
        XCTAssertEqual(result, "FeatureB: sum=11, product=30")
    }
}
