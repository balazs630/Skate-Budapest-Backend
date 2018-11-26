// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "SkateBudapestVapor",
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "3.1.0"),
    ],
    targets: [
        .target(name: "App", dependencies: ["Vapor"]),
        .target(name: "Run", dependencies: ["App"])
    ]
)
