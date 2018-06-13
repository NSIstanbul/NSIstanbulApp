//
//  EventbriteEventsRequest.swift
//  Networking
//
//  Created by Said Ozcan on 11/06/2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import Foundation

public struct EventbriteEventsRequest: EventbriteEndpoint {
    // MARK: Endpoint Protocol
    public typealias Response = [String]
    public var path: String = "/organizers/\(EventbriteConstants.organizationID)/events/"
    public var method: HTTPMethod = .get
    public var parameters: [String : Any] {
        let parameters: [String: Any] = [:]
        return parameters.merging(resolveTokenDictionary()) { (_, new) in new }
    }
    
    // MARK: EventbriteEndpoint Protocol
    public var tokenType: EventbriteEndpointToken = .standard
}
