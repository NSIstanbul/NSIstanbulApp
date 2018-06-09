//
//  CredentialsFile.swift
//  Networker
//
//  Created by Said Ozcan on 08/06/2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import Foundation

enum CredentialsFile: String {
    case eventbrite = "EventbriteCredentials"
    
    var extensionName: String {
        get {
            return ".plist"
        }
    }
}
