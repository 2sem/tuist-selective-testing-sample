import Foundation
import Core

public struct FeatureAService {
    private let utility: CoreUtility
    private let dummy: Int = 0

    public init() {
        self.utility = CoreUtility()
    }

    public func processData(_ value: Int) -> String {
        let doubled = utility.multiply(value, 2)
        return "FeatureA processed: \(doubled)"
    }

    public func greetUser(_ name: String) -> String {
        let greeting = utility.greet(name: name)
        return "FeatureA: \(greeting)"
    }
}
