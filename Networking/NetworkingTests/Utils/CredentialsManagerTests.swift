//
//  CredentialsManagerTests.swift
//  NetworkingTests
//
//  Created by Said Ozcan on 11/06/2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import XCTest
@testable import Networking

class CredentialsManagerTests: XCTestCase {
    // MARK: Properties
    let plistFile = EventbriteConstants.credentialsFileName
    let standardTokenType = EventbriteEndpointToken.standard.rawValue
    let personalTokenType = EventbriteEndpointToken.personal.rawValue
    
    // MARK: Tests
    func testReadingFromPlistFile() {
        let plistDictionary = CredentialsManager.current.readPlistContents(fromFile: plistFile)
        XCTAssertNotNil(plistDictionary)
    }
    
    func testEventbriteStandardToken() {
        let tokenValue = CredentialsManager.current.token(named: standardTokenType, in: plistFile)
        XCTAssertNotNil(tokenValue)
    }
    
    func testEventbritePersonalToken() {
        let tokenValue = CredentialsManager.current.token(named: personalTokenType, in: plistFile)
        XCTAssertNotNil(tokenValue)
    }
    
    func testRandomKeyInPlistFile() {
        let tokenValue = CredentialsManager.current.token(named: "randomPlistKey123", in: plistFile)
        XCTAssertNil(tokenValue)
    }
}
