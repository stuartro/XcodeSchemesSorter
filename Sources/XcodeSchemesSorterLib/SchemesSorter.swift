import Foundation
import XMLTools
import Regex

/// Utility that can sort schemes in an Xcode project.
public class SchemesSorter {
   // MARK: - OBJECT LIFECYCLE
   public init() {}
   
   // MARK: - PUBLIC FUNCTIONS
   public func sort(schemesXMLFile: String) throws -> String {
      let xmlContents = try String.init(contentsOfFile: schemesXMLFile)
      return try sort(schemesXML: xmlContents)
   }
   
   public func sort(schemesXML: String) throws ->  String {
      let parser = XMLTools.Parser()
      parser.options = XMLTools.Parser.Options(trimWhitespaces: true,
                                               replaceDuplicateSpacesWithSingleSpace: true)
      let xml = try parser.parse(string: schemesXML)
      
      let nodes = xml["plist", "dict"].childNodes().filter( {$0 is Element || $0 is TextNode} )
      for i in 0..<nodes.count {
         switch nodes[i] {
         case let elem as Element:
            switch elem.name().localName {
            case "key":
               let textNodes: [TextNode] = elem.childNodes.filterMap()
               if !textNodes.isEmpty, textNodes[0].value == "SchemeUserState" {
                  let dictNode = nodes[i+1]
                  sortSchemesDict(dictNode: dictNode as! Element)
               }
            default: continue
            } // switch name
         
         default: continue
         } // switch node
      }
      
      let xmlData = xml.document().data(.indent,.omitXMLDeclaration)
      let sortedSchemesXML = String(data: xmlData!, encoding: .utf8)!.replacingOccurrences(of: "ns0", with: "d")
//      let outputURL = URL(fileURLWithPath: outputXML)
//      try! xmlText.write(to: outputURL, atomically: true, encoding: String.Encoding.utf8)
//      printMsg("Wrote output to \(outputXML)")
//      printMsg("DONE")
      return sortedSchemesXML
   }
   
   // MARK: - PRIVATE FUNCTIONS
   private func sortSchemesDict(dictNode: Element) {
      let stripSchemeNameRegex = "^(.*)\\.xcscheme.*$".r!
      var schemeInfos = [SchemeInfo]()
      
      let elementNodes: [Element] = dictNode.childNodes.filterMap()
      for i in 0..<elementNodes.count {
         let node = elementNodes[i]
         switch node.name().localName {
         case "key":
            let textNodes: [TextNode] = node.childNodes.filterMap()
            if let match = stripSchemeNameRegex.findFirst(in: textNodes[0].value),
               let schemeName = match.group(at: 1) {
               let newSchemeInfo = SchemeInfo(name: schemeName, schemeDictElem: elementNodes[i+1])
               schemeInfos.append(newSchemeInfo)
            }
            
         default: continue
         }
      } // for i in 0..<elementNodes.count
      
      /// SORT SCHEMES BY NAME
      schemeInfos.sort { $0.name < $1.name }
      
      /// UPDATE ORDER HINT
      for i in 0..<schemeInfos.count {
         schemeInfos[i].orderHint = i
      }
   }
}

fileprivate class SchemeInfo {
   /// Name of the scheme
   public var name: String
   
   /// `<dict>` element that contains `<key>orderHint</key>` and `<integer>N</integer>` elements (where `N`
   /// is an integer representing the sort order for a particular scheme.
   public var schemeDictElem: Element
   
   public var orderHint: Int {
      get { Int(getOrderHint_IntegerNode().select().text)! }
      set { getOrderHint_IntegerNode().select().text = "\(newValue)" }
   }

   internal init(name: String, schemeDictElem: Element) {
      self.name = name
      self.schemeDictElem = schemeDictElem
   }
   
   // MARK: - PRIVATE FUNCTIONS
   
   /// Returns the `TextNode` contained within the element with name `<integer>` (which is a child node of `schemeDictElem`)
   private func getOrderHint_IntegerNode() -> Element {
      let elementNodes: [Element] = schemeDictElem.childNodes.filter { $0 is Element }.map { $0 as! Element }
      for i in 0..<elementNodes.count {
         let node = elementNodes[i]
         switch node.name().localName {
         case "key":
            let textNodes: [TextNode] = node.childNodes.filter { $0 is TextNode }.map { $0 as! TextNode }
            if !textNodes.isEmpty, textNodes[0].value == "orderHint" {
               let integerNode = elementNodes[i+1]
               return integerNode
            }
         default: continue
         }
      }
      fatalError("Unable to find <integer> node within scheme's <dict> node")
   }
}

fileprivate extension Array {
   func filterMap<Type>() -> [Type] {
      filter { $0 is Type }.map { $0 as! Type }
   }
}
