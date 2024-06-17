// swift-tools-version: 5.9
import PackageDescription

#if TUIST
    import ProjectDescription

    let packageSettings = PackageSettings(
        productTypes: [
            "Then": .framework,
            "SnapKit": .framework,
        ]
    )
#endif

let package = Package(
    name: "Timery",
    dependencies: [
        .package(path: .baseModulePath + "UI/ViewExtension"),
        .package(path: .baseModulePath + "UI/Home"),
        .package(path: .baseModulePath + "UI/TestDetail"),
        .package(path: .baseModulePath + "Core/Entity"),
        .package(path: .baseModulePath + "Core/DatabaseManager"),
        .package(path: .baseModulePath + "UI/Widget")
    ]
)

extension String {
    static var baseModulePath: Self {
        return "Timery/Modules/"
    }
}
