    import XCTest
    @testable import ceramic_swift

    final class ceramic_swiftTests: XCTestCase {
        func testExample() {
            // This is an example of a functional test case.
            // Use XCTAssert and related functions to verify your tests produce the correct
            // results.
            Stream.shared.getStreamState(streamID: "k2t6wyfsu4pg2qvoorchoj23e8hf3eiis4w7bucllxkmlk91sjgluuag5syphl") { res in
                switch res {
                case .success(let state):
                    print(state.state?.type ?? "error type")
                    print(state.state?.metadata?.family ?? "error family")
                case .failure(let error):
                    print(error.localizedDescription)
                }}
            XCTAssertEqual(ceramic_swift().text, "Hello, World!")
        }
    }
