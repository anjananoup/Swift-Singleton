import XCTest
@testable import AppLogger

final class AppLoggerTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        AppLogger.logInfo(message: "I Am simple Log")
        AppLogger.logError(message: "I Am simple Error Log")
        XCTAssert(true)
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
