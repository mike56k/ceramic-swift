    import XCTest
    @testable import ceramic_swift

    final class ceramic_swiftTests: XCTestCase {
        func testExample() {
            // This is an example of a functional test case.
            // Use XCTAssert and related functions to verify your tests produce the correct
            // results.
            Stream.shared.getStreamState(streamID: "k2t6wyfsu4pg2qvoorchoj23e8hf3eiis4w7bucllxkmlk91sjgluuag5syphl") { result in
                print("here")
            }
            XCTAssertEqual(ceramic_swift().text, "Hello, World!")
        }
    }
