import Foundation
import Core

public struct FeatureBService {
    private let utility: CoreUtility

    public init() {
        self.utility = CoreUtility()
    }

    public func calculate(_ a: Int, _ b: Int) -> String {
        let sum = utility.add(a, b)
        let product = utility.multiply(a, b)
        return "FeatureB: sum=\(sum), product=\(product)"
    }

    public func welcomeMessage(for name: String) -> String {
        let greeting = utility.greet(name: name)
        return "FeatureB welcomes you : \(greeting)"
    }
}
