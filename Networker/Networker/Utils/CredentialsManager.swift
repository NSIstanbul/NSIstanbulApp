//
//  CredentialsManager.swift
//  Networker
//
//  Created by Said Ozcan on 05/06/2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import Foundation

class CredentialsManager {
    // MARK: Properties
    static let current = CredentialsManager()
    private(set) var eventbriteToken: String = ""
    
    // MARK: Lifecycle
    init() {
        eventbriteToken = readEventbriteToken()
    }
    
    // MARK: Public
    func readFromFile(fileName: String) -> [String: Any]? {
        guard
            let bundlePath = Bundle(for: type(of: self)).path(forResource: CredentialsManager.eventbriteCredentialsFileName, ofType: ".plist"),
            let credentials = NSDictionary(contentsOfFile: bundlePath) as? [String: Any]
        else {
            return nil
        }
        return credentials
    }
}

extension CredentialsManager {
    // MARK: Properties
    private static let eventbriteCredentialsFileName: String = "EventbriteCredentials"
    private static let tokenKeyName: String = "token"
    
    // MARK: Public
    private func readEventbriteToken() -> String {
        guard let dict = readFromFile(fileName: CredentialsManager.eventbriteCredentialsFileName) else {
            fatalError("No such file named: \(CredentialsManager.eventbriteCredentialsFileName).plist")
        }
        guard let token = dict[CredentialsManager.tokenKeyName] as? String else {
            fatalError("No such key `token` in \(CredentialsManager.eventbriteCredentialsFileName).plist")
        }
        
        return token
    }
}
