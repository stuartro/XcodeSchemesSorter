// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
   name: "XcodeSchemesSorter",
   platforms: [
      .macOS(.v10_15),
   ],
   products: [
      .library(
         name: "XcodeSchemesSorterLib",
         targets: ["XcodeSchemesSorterLib"]),
      .executable(
         name: "xcssort",
         targets: ["xcssort"]),
   ],
   dependencies: [
      .package(url: "https://github.com/apple/swift-argument-parser", from: "0.0.1"),
      .package(url: "https://github.com/crossroadlabs/Regex.git", from: "1.2.0"),
      .package(url: "https://github.com/JohnSundell/ShellOut.git", from: "2.3.0"),
      .package(url: "https://github.com/stuartro/SwiftXMLTools.git", from: "1.0.2"),
      .package(url: "https://github.com/stuartro/TerminalColor.git", from: "1.0.0"),
   ],

   targets: [
      .target(name: "xcssort", dependencies: ["ArgumentParser", "TerminalColor", "XcodeSchemesSorterLib"]),
      .target(name: "XcodeSchemesSorterLib", dependencies: ["Regex", "ShellOut", "TerminalColor", "XMLTools"]),
      .testTarget(name: "XcodeSchemesSorterLibTests", dependencies: ["XcodeSchemesSorterLib"]),
   ]
)
