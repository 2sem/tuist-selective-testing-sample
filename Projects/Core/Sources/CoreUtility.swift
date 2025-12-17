import Foundation

public struct CoreUtility {
    public init() {}

    public func greet(name: String) -> String {
        return "Hello, \(name)!"
    }

    public func add(_ a: Int, _ b: Int) -> Int {
        return a + b
    }

    public func multiply(_ a: Int, _ b: Int) -> Int {
        return a * b
    }
}
