//
//  NSIstanbulAPITests.swift
//  NetworkingTests
//
//  Created by Said Ozcan on 17/06/2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import XCTest
@testable import Networking

class NSIstanbulAPITests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    func testRequest<RequestToTest>(request: RequestToTest, with completion: (Response<RequestToTest.Response>) -> Void) where RequestToTest: NSIstanbulEndpoint {
        let e = expectation(description: "NSIstanbul Request expectation")
        var response: Response<RequestToTest.Response>?
        
        Networking.shared.execute(request: request) { (r: Response<RequestToTest.Response>) in
            response = r
            e.fulfill()
        }
        
        waitForExpectations(timeout: 5)
        guard let r = response else {
            XCTFail("Request timed out")
            return
        }
        
        completion(r)
    }
    
    func testAboutRequest() {
        let request = NSIstanbulAboutRequest()
        testRequest(request: request) { (response) in
            switch response.result {
            case .success(let value):
                XCTAssertNotNil(value)
                XCTAssertTrue(!value.contributors.isEmpty)
                XCTAssertTrue(!value.description.isEmpty)
                
                guard let firstContributor = value.contributors.first else {
                    XCTFail("Expected a contributor inside json but could not find.")
                    break
                }
                XCTAssertTrue(!firstContributor.name.isEmpty)
                XCTAssertNotNil(firstContributor.avatarURL)
                XCTAssertNotNil(firstContributor.externalURL)
            case .failure(let error):
                XCTFail("Request failed: \(error)")
            }
        }
    }
    
    func testCompaniesRequest() {
        let request = NSIstanbulCompaniesRequest()
        Stubber.stubRequest(NSIstanbulCompaniesRequest(), withJSONFromFile: "NSIstanbulCompaniesResponse.json")
        testRequest(request: request) { (response) in
            switch response.result {
            case .success(let companies):
                XCTAssertNotNil(companies)
                guard let firstCompany = companies.first else {
                    XCTFail("Expected a company inside json but could not find.")
                    break
                }
                XCTAssertTrue(!firstCompany.name.isEmpty)
                XCTAssertNotNil(firstCompany.contactURL)
                XCTAssertNotNil(firstCompany.email)
                XCTAssertNotNil(firstCompany.logoURL)
                XCTAssertTrue(!firstCompany.apps.isEmpty)
                
                guard let firstApp = companies.first?.apps.first else {
                    XCTFail("Expected a company inside json but could not find.")
                    break
                }
                XCTAssertTrue(!firstApp.name.isEmpty)
                XCTAssertNotNil(firstApp.iconURL)
                XCTAssertNotNil(firstApp.externalURL)
            case .failure(let error):
                XCTFail("Request failed: \(error)")
            }
        }
    }
    
    func testJobsRequest() {
        let request = NSIstanbulJobsRequest()
        Stubber.stubRequest(NSIstanbulJobsRequest(), withJSONFromFile: "NSIstanbulJobsResponse.json")
        testRequest(request: request) { (response) in
            switch response.result {
            case .success(let jobs):
                XCTAssertNotNil(jobs)
                guard let firstJob = jobs.first else {
                    XCTFail("Expected a job inside the json but could not find.")
                    break
                }
                XCTAssertTrue(!firstJob.city.isEmpty)
                XCTAssertTrue(!firstJob.companyName.isEmpty)
                XCTAssertTrue(!firstJob.positionTitle.isEmpty)
                XCTAssertNotNil(firstJob.url)
            case .failure(let error):
                XCTFail("Request failed: \(error)")
            }
        }
    }
}
