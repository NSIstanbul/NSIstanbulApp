//
//  EventAvailability.swift
//  Networking
//
//  Created by Said Ozcan on 14/06/2018.
//  Copyright © 2018 Ilter Cengiz. All rights reserved.
//

import Foundation

// MARK: EventAvailability
public struct EventAvailability: Codable {
    let hasAvailableTickets: Bool
    let isSoldOut: Bool
}

// MARK: EventAvailabilityCodingKeys
private extension EventAvailability {
    enum CodingKeys: String, CodingKey {
        case hasAvailableTickets = "has_available_tickets"
        case isSoldOut = "is_sold_out"
    }
}
