// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TimeryWidget",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "TimeryWidget",
            targets: ["TimeryWidget"]),
    ],
    dependencies: [
        // 위젯에서 사용될 외부 패키지가 있다면 여기에 추가합니다.
        // .package(url: "https://github.com/Dependency/Dependency.git", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "TimeryWidget",
            dependencies: []
        ),
        .testTarget(
            name: "TimeryWidgetTests",
            dependencies: ["TimeryWidget"]
        )
    ]
)
