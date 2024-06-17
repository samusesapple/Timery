// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Widget",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "Widget",
            targets: ["Widget"]),
    ],
    dependencies: [
        // 위젯에서 사용될 외부 패키지가 있다면 여기에 추가합니다.
        // .package(url: "https://github.com/Dependency/Dependency.git", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "Widget",
            dependencies: []
        ),
        .testTarget(
            name: "WidgetTests",
            dependencies: ["Widget"]
        )
    ]
)
