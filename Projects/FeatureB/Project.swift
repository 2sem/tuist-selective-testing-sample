import ProjectDescription

let project = Project(
    name: "FeatureB",
    targets: [
        .target(
            name: "FeatureB",
            destinations: .iOS,
            product: .framework,
            bundleId: "sample.tuist.selective.featureB",
            infoPlist: .default,
            sources: ["Sources/**"],
            dependencies: [
                .project(target: "Core", path: "../Core")
            ]
        ),
        .target(
            name: "FeatureBTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "sample.tuist.selective.featureB.tests",
            infoPlist: .default,
            sources: ["Tests/**"],
            dependencies: [
                .target(name: "FeatureB")
            ]
        )
    ]
)
