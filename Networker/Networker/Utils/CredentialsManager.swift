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
    
    // MARK: Lifecycle
    init() {}
    
    // MARK: Public
    func readPlistContents(fromFile file: CredentialsFile) -> [String: Any]? {
        guard
            let bundlePath = Bundle(for: type(of: self)).path(forResource: file.rawValue, ofType: file.extensionName),
            let credentials = NSDictionary(contentsOfFile: bundlePath) as? [String: Any]
        else {
            return nil
        }
        return credentials
    }
    
    func token(named tokenKeyName: String, in credentialsFile: CredentialsFile) -> String? {
        guard let plistDictionary = readPlistContents(fromFile: credentialsFile) else {
            return nil
        }
        
        guard let token = plistDictionary[tokenKeyName] as? String else {
            return nil
        }
        
        return token
    }
}
