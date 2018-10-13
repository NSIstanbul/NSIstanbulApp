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
    public typealias Response = EventsListResult
    public var path: String = "/v3/organizers/\(EventbriteConstants.organizationID)/events/"
    public var method: HTTPMethod = .get
    public var parameters: [String : Any] {
        var parameters: [String: Any] = [
            "status": "all",
            "order_by": "created_desc",
            "expand": "ticket_availability,venue,attendee,ticket_classes,logo"
        ]
        parameters["token"] = resolveToken()
        return parameters
    }
    
    // MARK: EventbriteEndpoint Protocol
    public var tokenType: EventbriteEndpointToken = .personal

    public init() {}
}
