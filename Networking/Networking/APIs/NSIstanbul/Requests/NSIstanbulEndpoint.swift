//
//  NSIstanbulEndpoint.swift
//  Networking
//
//  Created by Said Ozcan on 17/06/2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import Foundation

// MARK: NSIstanbulEndpoint
public protocol NSIstanbulEndpoint: Endpoint {}


// MARK: NSIstanbulEndpoint: Endpoint
extension NSIstanbulEndpoint {
    public var api: API {
        return API(baseURL: BaseURL(scheme: "https", host: "nsistanbulapi.herokuapp.com"))
    }
    
    public var additionalHeaders: [String : String] {
        guard let authHeader = resolveAuthorizationHeader() else { return [:] }
        return ["Authorization": authHeader]
    }
}


// MARK: NSIstanbulEndpoint Private Helpers
extension NSIstanbulEndpoint {
    func resolveAuthorizationHeader() -> String? {
        let token: String? = CredentialsManager.current.token(named: "Authorization",
                                                             in: NSIstanbulAPIConstants.credentialsFileName)
        guard let apiToken = token else { return nil }
        return apiToken
    }
}


// MARK: NSIstanbulAPIConstants
enum NSIstanbulAPIConstants {
    static let credentialsFileName: String = "NSIstanbulAPICredentials"
}
