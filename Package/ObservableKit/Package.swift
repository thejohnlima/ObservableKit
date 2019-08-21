// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

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
