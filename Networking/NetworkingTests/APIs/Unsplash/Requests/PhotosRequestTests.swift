//
//  PhotosRequestTests.swift
//  NetworkingTests
//
//  Created by Ilter Cengiz on 03/01/18.
//  Copyright © 2018 Ilter Cengiz. All rights reserved.
//

import XCTest
@testable import Networking

class PhotosRequestTests: XCTestCase {
    
    private let request = PhotosRequest()
    
    override func setUp() {
        super.setUp()
        /// Stub request
        Stubber.stubRequest(request, withJSONFromFile: "Photos.json")
    }
    
    /// Test to fetch a list of photos
    func testPhotosRequest() {
        let e = expectation(description: "PhotosRequest completes")
        
        var response: Response<PhotosRequest.Response>?
        Networking.shared.execute(request: request) {
            response = $0
            e.fulfill()
        }
        
        waitForExpectations(timeout: 5)
        guard let r = response else {
            XCTFail("Request timed out")
            return
        }
        
        switch r.result {
        case .success(let photos):
            XCTAssertEqual(photos.count, 10, "Parsing photos failed")
            guard let firstPhoto = photos.first else {
                XCTFail("Couldn't get the first photo")
                return
            }
            XCTAssertEqual(firstPhoto.photoID, "afGpHlrq0ko", "photoID doesn't match")
            XCTAssertEqual(firstPhoto.width, 3648, "width doesn't match")
            XCTAssertEqual(firstPhoto.height, 5472, "height doesn't match")
            XCTAssertEqual(firstPhoto.likes, 16, "likes doesn't match")
            XCTAssertEqual(firstPhoto.height, 5472, "height doesn't match")
            XCTAssertEqual(firstPhoto.rawURL, URL(string: "https://images.unsplash.com/photo-1514542256430-d2852713eda4")!, "rawURL doesn't match")
            XCTAssertEqual(firstPhoto.fullURL, URL(string: "https://images.unsplash.com/photo-1514542256430-d2852713eda4?ixlib=rb-0.3.5&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjUzMjd9%0A&s=4cd570380e7e31915b61395353b815c8")!, "fullURL doesn't match")
            XCTAssertEqual(firstPhoto.regularURL, URL(string: "https://images.unsplash.com/photo-1514542256430-d2852713eda4?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjUzMjd9%0A&s=61dcd7564a96b763037154764a029264")!, "regularURL doesn't match")
            XCTAssertEqual(firstPhoto.smallURL, URL(string: "https://images.unsplash.com/photo-1514542256430-d2852713eda4?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&ixid=eyJhcHBfaWQiOjUzMjd9%0A&s=a44403c2a0d5b2d51bb4b47abee488f3")!, "smallURL doesn't match")
            XCTAssertEqual(firstPhoto.thumbURL, URL(string: "https://images.unsplash.com/photo-1514542256430-d2852713eda4?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&ixid=eyJhcHBfaWQiOjUzMjd9%0A&s=24d710f41b834c28c957bcf7ab7b1b17")!, "thumbURL doesn't match")
        case .failure(let error):
            XCTFail("Request failed: \(error)")
        }
    }
    
}
