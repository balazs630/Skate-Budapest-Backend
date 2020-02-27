// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "SkateBudapestVapor",
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "3.3.3"),
        .package(url: "https://github.com/vapor/fluent-postgresql.git", from: "1.0.0")
    ],
    targets: [
        .target(name: "App", dependencies: ["Vapor", "FluentPostgreSQL"]),
        .target(name: "Run", dependencies: ["App"])
    ]
)
