// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "msdf-atlas-gen",
    platforms: [
        .iOS(.v13),
        .macOS(.v11),
    ],
    products: [
        .library(
            name: "msdf-atlas-gen",
            targets: ["msdf-atlas-gen"]
        )
    ],
    dependencies: [ ],
    targets: [
        .target(
            name: "msdfgen",
            dependencies: [
                "tinyxml",
                "freetype"
            ],
            path: "msdfgen",
            publicHeadersPath: ".",
            cxxSettings: [
                .define("_CRT_SECURE_NO_WARNINGS")
            ]
        ),
        .target(
            name: "msdf-atlas-gen",
            dependencies: [
                "msdfgen"
            ],
            path: "msdf-atlas-gen",
            publicHeadersPath: ".",
            cxxSettings: [
                .define("_CRT_SECURE_NO_WARNINGS")
            ]
        ),
        .systemLibrary(
            name: "freetype",
            path: "freetype",
            pkgConfig: "freetype2",
            providers: [
                .brewItem(["freetype2"]),
                .aptItem(["libfreetype6-dev"])
            ]
        ),
        .target(
            name: "tinyxml",
            path: "tinyxml",
            publicHeadersPath: "."
        )
    ],
    swiftLanguageVersions: [.v5],
    cxxLanguageStandard: .cxx14
)
