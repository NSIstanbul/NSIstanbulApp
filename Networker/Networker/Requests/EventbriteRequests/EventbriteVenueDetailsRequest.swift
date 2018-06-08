//
//  EventbriteVenueDetailsRequest.swift
//  Networker
//
//  Created by Said Ozcan on 08/06/2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import Foundation

public struct EventbriteVenueDetailsRequest: EventbriteBaseRequest {
    // MARK: Properties
    private let venueID: String
    
    // MARK: Lifecycle
    public init(venueID: String) {
        self.venueID = venueID
    }
    
    // MARK: EventbriteBaseRequest Protocol
    public var token: String? {
        get {
            return CredentialsManager.current.token(named: EventbriteEndpointToken.personal.rawValue,
                                                    in: CredentialsFile.eventbrite)
        }
    }
    public var path: String {
        get {
            return "/v3/venues/\(venueID)/"
        }
    }
}
