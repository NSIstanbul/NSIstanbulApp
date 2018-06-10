//
//  NetworkingTests.swift
//  NetworkingTests
//
//  Created by Ilter Cengiz on 22/12/17.
//  Copyright © 2017 Ilter Cengiz. All rights reserved.
//

import XCTest
@testable import Networking


/// Sample JSON data that will be used to mock the `SampleUserListRequest`
private let JSONData = """
    {
        "page": 2,
        "per_page": 3,
        "total": 12,
        "total_pages": 4,
        "data": [
            {
                "id": 4,
                "first_name": "Eve",
                "last_name": "Holt",
                "avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/marcoramires/128.jpg"
            },
            {
                "id": 5,
                "first_name": "Charles",
                "last_name": "Morris",
                "avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/stephenmoon/128.jpg"
            },
            {
                "id": 6,
                "first_name": "Tracey",
                "last_name": "Ramos",
                "avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/bigmancho/128.jpg"
            }
        ]
    }
""".data(using: .utf8)!


/// A sample model for a user
private struct SampleUser {
    let id: Int
    let firstName: String
    let lastName: String
    let profileImageURL: URL
}

/// Extension for parsing logic of `SampleUser` model
extension SampleUser: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case firstName = "first_name"
        case lastName = "last_name"
        case profileImageURL = "avatar"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let id = try container.decode(Int.self, forKey: .id)
        let firstName = try container.decode(String.self, forKey: .firstName)
        let lastName = try container.decode(String.self, forKey: .lastName)
        let profileImageURL = try container.decode(URL.self, forKey: .profileImageURL)
        self.init(id: id,
                  firstName: firstName,
                  lastName: lastName,
                  profileImageURL: profileImageURL)
    }
    
}


/// Response model for user list
private struct SampleUserListResponse {
    let page: Int
    let perPage: Int
    let total: Int
    let totalPages: Int
    let data: [SampleUser]
}

/// Extension for parsing logic of `SampleUserListResponse`
extension SampleUserListResponse: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case page = "page"
        case perPage = "per_page"
        case total = "total"
        case totalPages = "total_pages"
        case data = "data"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let page = try container.decode(Int.self, forKey: .page)
        let perPage = try container.decode(Int.self, forKey: .perPage)
        let total = try container.decode(Int.self, forKey: .total)
        let totalPages = try container.decode(Int.self, forKey: .totalPages)
        let data = try container.decode([SampleUser].self, forKey: .data)
        self.init(page: page,
                  perPage: perPage,
                  total: total,
                  totalPages: totalPages,
                  data: data)
    }
    
}


/// A sample request to get a list of users
private struct SampleUserListRequest: Endpoint {
    typealias Response = SampleUserListResponse
    let api: API = API(baseURL: BaseURL(scheme: "http", host: "www.sampleusers.com"))
    let path: String = "/users"
    let method: HTTPMethod = .get
}


/// Tests
class NetworkingTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        /// Stub sample request with `JSONData`
        Stubber.stubRequest(SampleUserListRequest(), with: JSONData)
    }
    
    /// Test to fetch a list of users
    func testSampleUserList() {
        let e = expectation(description: "SampleUserListRequest completes")
        
        let request = SampleUserListRequest()
        var response: Response<SampleUserListRequest.Response>?
        Networking.shared.execute(request: request) {
            (r: Response<SampleUserListRequest.Response>) in
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
            XCTAssertEqual(value.page, 2, "page doesn't match")
            XCTAssertEqual(value.perPage, 3, "perPage doesn't match")
            XCTAssertEqual(value.total, 12, "total doesn't match")
            XCTAssertEqual(value.totalPages, 4, "totalPages doesn't match")
            XCTAssertEqual(value.data.count, 3, "Missing user from data list")
            
            let user = value.data[1]
            XCTAssertEqual(user.id, 5, "id doesn't match")
            XCTAssertEqual(user.firstName, "Charles", "firstName doesn't match")
            XCTAssertEqual(user.lastName, "Morris", "lastName doesn't match")
            let url = URL(string: "https://s3.amazonaws.com/uifaces/faces/twitter/stephenmoon/128.jpg")!
            XCTAssertEqual(user.profileImageURL, url, "profileImageURL doesn't match")
        case .failure(let error):
            XCTFail("Request failed: \(error)")
        }
    }
    
}
