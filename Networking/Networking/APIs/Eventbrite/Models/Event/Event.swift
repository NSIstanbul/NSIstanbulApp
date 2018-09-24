//
//  Event.swift
//  Networking
//
//  Created by Said Ozcan on 14/06/2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import Foundation

// MARK: Event
public struct Event {
    public let name: String
    public let startDate: Date
    public let status: EventStatus
    
    public let logo: EventLogo
    public let venue: EventVenue
    public let tickets: [EventTicket]
    public let availability: EventAvailability
}

private extension Event {
    
    // MARK: Event Object Root Keys
    enum CodingKeys {
        enum root: String, CodingKey {
            case name
            case startDate = "start"
            case status
            case logo
            case venue
            case tickets = "ticket_classes"
            case availability = "ticket_availability"
        }
        
        // MARK: Event Name Coding Keys
        enum name: String, CodingKey {
            case text
        }
        
        // MARK: Start Date Coding Keys
        enum startDate: String, CodingKey {
            case utc
        }
    }
    
    // MARK: Individual Decoders
    static func decodeName(from container: KeyedDecodingContainer<Event.CodingKeys.root>) throws -> String {
        let nameContainer = try container.nestedContainer(keyedBy: Event.CodingKeys.name.self, forKey: .name)
        return try nameContainer.decode(String.self, forKey: .text)
    }
    
    static func decodeStartDate(from container: KeyedDecodingContainer<Event.CodingKeys.root>) throws -> Date {
        // Getting nested container for start date
        let startDateContainer = try container.nestedContainer(keyedBy: Event.CodingKeys.startDate.self, forKey: .startDate)
        let startDateString = try startDateContainer.decode(String.self, forKey: .utc)
        
        // Trying to format the date
        guard let date = DateFormatter.iso8601Full.date(from: startDateString) else {
            let debugDescription = "Event: Date string does not match format expected by formatter."
            throw DecodingError.dataCorruptedError(forKey: .startDate,
                                                   in: container,
                                                   debugDescription: debugDescription)
        }
        
        return date
    }
}

// MARK: Event: Decodable
extension Event: Decodable {
    public init(from decoder: Decoder) throws {
        // Root container
        let rootContainer = try decoder.container(keyedBy: Event.CodingKeys.root.self)
    
        // Decoding properties
        name = try Event.decodeName(from: rootContainer)
        startDate = try Event.decodeStartDate(from: rootContainer)
        status = try rootContainer.decode(EventStatus.self, forKey: .status)
        logo = try rootContainer.decode(EventLogo.self, forKey: .logo)
        venue = try rootContainer.decode(EventVenue.self, forKey: .venue)
        tickets = try rootContainer.decode([EventTicket].self, forKey: .tickets)
        availability = try rootContainer.decode(EventAvailability.self, forKey: .availability)
    }
}
