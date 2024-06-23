// swift-tools-version: 5.9
import PackageDescription

#if TUIST
    import ProjectDescription

    let packageSettings = PackageSettings(
        productTypes: [:]
    )
#endif

let package = Package(
    name: "Timery",
    dependencies: [
        .package(path: .baseModulePath + "UI/Home"),
        .package(path: .baseModulePath + "UI/TestDetail"),
        .package(path: .baseModulePath + "Core/Entity"),
        .package(path: .baseModulePath + "Core/DatabaseManager"),
        .package(path: .baseModulePath + "UI/TimeryWidget")
    ]
)

extension String {
    static var baseModulePath: Self {
        return "../Modules/"
    }
}
