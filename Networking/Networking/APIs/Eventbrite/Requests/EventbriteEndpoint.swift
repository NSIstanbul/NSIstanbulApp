//
//  EventbriteEndpoint.swift
//  Networking
//
//  Created by Said Ozcan on 11/06/2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import Foundation

// MARK: EventbriteConstants
enum EventbriteConstants {
    static let credentialsFileName: String = "EventbriteCredentials"
    static let organizationID: String = "13871494483"
}

// MARK: EventbriteEndpoint
public protocol EventbriteEndpoint: Endpoint {
    // Default implementation for Eventbrite API
    
    // Eventbrite API token type to be used
    var tokenType: EventbriteEndpointToken { get }
}

// MARK: Default Endpoint Implementations
extension EventbriteEndpoint {
    
    // MARK: Endpoint Protocol Default Values
    /// This implementation will save us from implementing the same `api` variable
    /// in every endpoint for Eventbrite
    public var api: API {
        return API(baseURL: BaseURL(scheme: "https", host: "eventbriteapi.com/v3"))
    }
}

// MARK: Private Methods
extension EventbriteEndpoint {
    func resolveToken() -> String? {
        let token: String?
        switch tokenType {
        case .personal:
            token = CredentialsManager.current.token(named: EventbriteEndpointToken.personal.rawValue,
                                                     in: EventbriteConstants.credentialsFileName)
        default:
            token = CredentialsManager.current.token(named: EventbriteEndpointToken.standard.rawValue,
                                                   in: EventbriteConstants.credentialsFileName)
        }
        
        guard let apiToken = token else { return nil }
        return apiToken
    }
}
