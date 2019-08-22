// swift-tools-version:5.1

import PackageDescription

let package = Package(
  name: "ObservableKit",
  products: [
    .library(
      name: "ObservableKit",
      targets: ["ObservableKit"]
    ),
  ],
  dependencies: [],
  targets: [
    .target(
      name: "ObservableKit",
      dependencies: []
    ),
    .testTarget(
      name: "ObservableKitTests",
      dependencies: ["ObservableKit"]
    ),
  ]
)
