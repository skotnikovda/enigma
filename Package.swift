// swift-tools-version:5.6
import PackageDescription

let package = Package(
  name: "Enigma",
  platforms: [
    .macOS(.v12)
  ],
  products: [
    .library(name: "Enigma", targets: ["Enigma"]),
    .executable(name: "EnigmaExample", targets: ["EnigmaExample"])
  ],
  targets: [
    .target(name: "Enigma", dependencies: [], path: "Sources"),
    .executableTarget(name: "EnigmaExample", dependencies: ["Enigma"], path: "Examples")
  ]
)
