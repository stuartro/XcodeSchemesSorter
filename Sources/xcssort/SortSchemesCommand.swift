import Foundation
import ArgumentParser
import XcodeSchemesSorterLib
import TerminalColor

struct SortSchemesCommand: ParsableCommand {
   static let configuration = CommandConfiguration(commandName: "sortSchemes", abstract: "Sort schemes in an Xcode project")
   
   @Option(name: [.customLong("projectFile")], help: "The Xcode project (i.e. .xcodeproj) whose schemes are to be sorted.")
   var projectFile: String
   
   func run() {
      do {
         let schemesPListPath = try SchemesPListFinder().findSchemesPlistFile(for: projectFile)
         let schemesPListXML = try SchemesSorter().sort(schemesXMLFile: schemesPListPath)
         try schemesPListXML.write(to: URL(fileURLWithPath: schemesPListPath, isDirectory: false), atomically: true, encoding: .utf8)
         print("Successfully sorted schemes in \(projectFile)")
      } catch  {
         print(error)
      }
   }
}
