//
//  EventbriteEventVenueDetailsRequest.swift
//  Networking
//
//  Created by Said Ozcan on 11/06/2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import Foundation

public struct EventbriteEventVenueDetailsRequest: EventbriteEndpoint {
    // MARK: Properties
    private let venueID: String
    
    // MARK: Lifecycle
    public init(venueID: String) {
        self.venueID = venueID
    }
    
    // MARK: EventbriteEndpoint Protocol
    public typealias Response = [String]
    public var path: String {
        return "/v3/venues/\(venueID)/"
    }
    public var method: HTTPMethod = .get
    public var parameters: [String : Any] {
        let parameters: [String: Any] = [:]
        return parameters.merging(resolveTokenDictionary()) { (_, new) in new }
    }
    public var tokenType: EventbriteEndpointToken = .personal
}
