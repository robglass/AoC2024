// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "AoC2024",
    targets: [
        .executableTarget(
            name: "AoC2024"),
        .testTarget(
            name: "AoC2024Tests",
            dependencies: ["AoC2024"]
        ),
    ]
)
