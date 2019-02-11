// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "SkateBudapestVapor",
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "3.1.0"),
        .package(url: "https://github.com/vapor/sqlite.git", from: "3.0.0"),
        .package(url: "https://github.com/vapor/fluent-sqlite.git", from: "3.0.0")
    ],
    targets: [
        .target(name: "App", dependencies: ["Vapor", "SQLite", "FluentSQLite"]),
        .target(name: "Run", dependencies: ["App"])
    ]
)
