import ProjectDescription

let baseSettings: [String: SettingValue] = [
    "MARKETING_VERSION": "1.0.0",
    "CURRENT_PROJECT_VERSION": "1.0.0.0"
]

let infoPlist: [String : Plist.Value] = [
    "CFBundleDisplayName": "Timery",
    "CFBundleShortVersionString": "1.0",
    "CFBundleVersion": "1.0.0.0",
    "UILaunchStoryboardName": "LaunchScreen.storyboard",
    "UIApplicationSceneManifest": [
        "UIApplicationSupportsMultipleScenes": false,
        "UISceneConfigurations": [
            "UIWindowSceneSessionRoleApplication": [
                [
                    "UISceneConfigurationName": "Default Configuration",
                    "UISceneDelegateClassName": "$(PRODUCT_MODULE_NAME).SceneDelegate"
                ]
            ]
        ]
    ],
]

let deploymentTarget: DeploymentTargets = .iOS("17.0")

let project = Project(
    name: "Timery",
    packages: [
        .local(path: .relativeToRoot("Modules/UI/ViewExtension")),
        .local(path: .relativeToRoot("Modules/UI/Home")),
        .local(path: .relativeToRoot("Modules/UI/TestDetail")),
        .local(path: .relativeToRoot("Modules/UI/TimeryWidget")),
        .local(path: .relativeToRoot("Modules/Core/Entity")),
        .local(path: .relativeToRoot("Modules/Core/DatabaseManager")),
    ],
    targets: [
        .target(
            name: "Timery",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.Timery",
            deploymentTargets: deploymentTarget,
            infoPlist: .extendingDefault(with: infoPlist),
            sources: ["App/Sources/**"],
            resources: ["App/Resources/**"],
            dependencies: [
                .package(product: "ViewExtension"),
                .package(product: "Home"),
                .package(product: "TestDetail"),
                .package(product: "DatabaseManager"),
                .package(product: "Entity"),
                // .package(product: "TimeryWidget")
            ],
            coreDataModels: [
                .coreDataModel(
                    "App/Resources/Timery.xcdatamodeld",
                    currentVersion: "Model"
                )
            ]
        ),
        .target(
            name: "TimeryTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.TimeryTests",
            infoPlist: .default,
            sources: ["App/Tests/**"],
            resources: [],
            dependencies: [.target(name: "Timery")]
        ),
        .target(
            name: "TimeryWidget",
            destinations: .iOS,
            product: .appExtension,
            bundleId: "io.tuist.TimeryWidget",
            deploymentTargets: deploymentTarget,
            infoPlist: .file(path: "Modules/UI/TimeryWidget/Sources/Info.plist"),
            sources: ["Modules/UI/TimeryWidget/Sources/**"],
            resources: [],
            dependencies: []
        )
    ]
)

