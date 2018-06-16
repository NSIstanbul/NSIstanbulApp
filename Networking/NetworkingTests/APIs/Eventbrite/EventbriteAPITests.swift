//
//  EventbriteAPITests.swift
//  NetworkingTests
//
//  Created by Said Ozcan on 14/06/2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import XCTest
@testable import Networking

class EventbriteAPITests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        Stubber.stubRequest(EventbriteEventsRequest(), withJSONFromFile: "EventsListResponse.json")
    }
    
    func testEventsList() {
        let e = expectation(description: "EventsList completes")
        
        let request = EventbriteEventsRequest()
        var response: Response<EventbriteEventsRequest.Response>?
        Networking.shared.execute(request: request) {
            (r: Response<EventbriteEventsRequest.Response>) in
            response = r
            e.fulfill()
        }
        
        waitForExpectations(timeout: 5)
        guard let r = response else {
            XCTFail("Request timed out")
            return
        }
        
        switch r.result {
        case .success(let value):
            XCTAssertNotNil(value)
            XCTAssertEqual(value.pagination.objectCount, value.events.count)
            XCTAssertNotNil(value.events.first)
            guard let firstEvent = value.events.first else {
                XCTAssert(false)
                break
            }
            
            XCTAssertEqual(firstEvent.venue.name, "sahibinden.com")
            XCTAssertTrue(firstEvent.availability.isSoldOut)
            XCTAssertEqual(firstEvent.logo.url?.absoluteString, "https://img.evbuc.com/https%3A%2F%2Fcdn.evbuc.com%2Fimages%2F45404553%2F21793522196%2F1%2Foriginal.jpg?h=200&w=450&auto=compress&rect=0%2C0%2C2160%2C1080&s=1c506d226e5329f74e90497e48f3bce9")
        case .failure(let error):
            XCTFail("Request failed: \(error)")
        }
    }
}
