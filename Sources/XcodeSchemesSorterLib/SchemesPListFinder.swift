import Foundation
import ShellOut

/// Utility to find the `xcschememanagement.plist` file inside an
/// Xcode project (i.e. a `.xcodeproj` bundle structure).
public class SchemesPListFinder {
   // MARK: - OBJECT LIFECYCLE
   public init() {}
   
   // MARK: - PUBLIC FUNCTIONS
   public func findSchemesPlistFile(for xcodeProj: String) throws ->  String {
      let schemesPListPath = try! shellOut(to: "cd \"\(xcodeProj)\"; find . -name \"xcschememanagement.plist\" -print")
      let projectURL = URL(fileURLWithPath: xcodeProj, isDirectory: true)
      return projectURL.appendingPathComponent(schemesPListPath).standardized.path
   }
}
