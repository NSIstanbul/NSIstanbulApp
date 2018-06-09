//
//  EventbriteEventsRequest.swift
//  NSIstanbul
//
//  Created by Bilal Arslan on 7.06.2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import Foundation

public struct EventbriteEventsRequest: EventbriteBaseRequest {
    // MARK: Lifecycle
    public init() {}
    
    // MARK: EventbriteBaseRequest
    var token: String? {
        return nil
    }
    public var path: String = "/organizers/\(Constants.organizationID)/events/"
}

