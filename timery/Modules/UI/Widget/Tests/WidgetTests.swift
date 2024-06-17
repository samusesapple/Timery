import XCTest
@testable import Widget

class WidgetTests: XCTestCase {

    func testPlaceholder() {
        let provider = Provider()
        let context = Context()
        let entry = provider.placeholder(in: context)
        
        XCTAssertNotNil(entry)
        XCTAssert(entry.date <= Date(), "Placeholder date should be current or past date")
    }

    func testGetSnapshot() {
        let provider = Provider()
        let context = Context()
        let expectation = self.expectation(description: "Snapshot")
        
        provider.getSnapshot(in: context) { entry in
            XCTAssertNotNil(entry)
            XCTAssert(entry.date <= Date(), "Snapshot date should be current or past date")
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testGetTimeline() {
        let provider = Provider()
        let context = Context()
        let expectation = self.expectation(description: "Timeline")
        
        provider.getTimeline(in: context) { timeline in
            XCTAssertNotNil(timeline)
            XCTAssertFalse(timeline.entries.isEmpty, "Timeline should have entries")
            
            for entry in timeline.entries {
                XCTAssert(entry.date <= Date().addingTimeInterval(5 * 3600), "Entries should be within 5 hours from now")
            }
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 1, handler: nil)
    }
}

private struct Context: TimelineProviderContext {}
