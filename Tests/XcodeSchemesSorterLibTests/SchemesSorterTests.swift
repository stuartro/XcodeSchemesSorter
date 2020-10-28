import XCTest
@testable import XcodeSchemesSorterLib

final class SchemesSorterTests: XCTestCase {
   
   func test() {
      let sut = SchemesSorter()
      let result = try! sut.sort(schemesXML: testSchemesPlist_Input_XML)
//      XCTAssertEqual(result, testSchemesPlist_ExpectedOutput_XML)
   }
   
   static var allTests = [
      ("test",test),
   ]
}
