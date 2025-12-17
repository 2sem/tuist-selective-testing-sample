import ProjectDescription

let project = Project(
    name: "FeatureA",
    targets: [
        .target(
            name: "FeatureA",
            destinations: .iOS,
            product: .framework,
            bundleId: "sample.tuist.selective.featureA",
            infoPlist: .default,
            sources: ["Sources/**"],
            dependencies: [
                .project(target: "Core", path: "../Core")
            ]
        ),
        .target(
            name: "FeatureATests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "sample.tuist.selective.featureA.tests",
            infoPlist: .default,
            sources: ["Tests/**"],
            dependencies: [
                .target(name: "FeatureA")
            ]
        )
    ]
)
