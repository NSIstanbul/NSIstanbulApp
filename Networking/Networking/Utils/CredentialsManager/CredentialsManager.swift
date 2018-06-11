//
//  CredentialManager.swift
//  Networking
//
//  Created by Said Ozcan on 11/06/2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import Foundation

class CredentialsManager {
    // MARK: Properties
    static let current = CredentialsManager()
    
    // MARK: Lifecycle
    init() {}
    
    // MARK: Public
    func readPlistContents(fromFile file: String) -> [String: Any]? {
        guard
            let bundlePath = Bundle(for: type(of: self)).path(forResource: file, ofType: Constants.defaultCredentialsFileExtension),
            let credentials = NSDictionary(contentsOfFile: bundlePath) as? [String: Any]
            else {
                return nil
        }
        return credentials
    }
    
    func token(named tokenKeyName: String, in credentialsFile: String) -> String? {
        guard let plistDictionary = readPlistContents(fromFile: credentialsFile) else {
            return nil
        }
        
        guard let token = plistDictionary[tokenKeyName] as? String else {
            return nil
        }
        
        return token
    }
}
