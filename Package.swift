// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CodeEditLanguages",
    platforms: [.macOS(.v13), .visionOS(.v1)],
    products: [
        .library(
            name: "CodeEditLanguages",
            targets: ["CodeEditLanguages"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/ChimeHQ/SwiftTreeSitter.git",
            exact: "0.8.0"
        ),
    ],
    targets: [
        .target(
            name: "CodeEditLanguages",
            dependencies: ["CodeLanguagesContainer", "SwiftTreeSitter"],
            resources: [
                .copy("Languages")
            ],
            linkerSettings: [.linkedLibrary("c++")]
        ),
        .binaryTarget(
            name: "CodeLanguagesContainer",
            path: "CodeLanguagesContainer.xcframework.zip"
        ),

        .testTarget(
            name: "CodeEditLanguagesTests",
            dependencies: ["CodeEditLanguages"]
        ),
    ]
)
