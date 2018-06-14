//
//  Event.swift
//  Networking
//
//  Created by Said Ozcan on 14/06/2018.
//  Copyright © 2018 Ilter Cengiz. All rights reserved.
//

import Foundation

// MARK: Event
public struct Event {
    let name: String
    let startDate: Date
    let status: EventStatus
    
    let logo: EventLogo
    let venue: EventVenue
    let tickets: [EventTicket]
    let availability: EventAvailability
}

// MARK: Event Object Coding Keys
extension Event {
    // MARK: Event Object Coding Keys
    enum CodingKeys: String, CodingKey {
        case name
        case startDate = "start"
        case status
        case logo
        case venue
        case tickets = "ticket_classes"
        case availability = "ticket_availability"
    }
    
    // MARK: Event Name Coding Keys
    enum EventNameCodingKeys: String, CodingKey {
        case text
    }
    
    // MARK: Start Date Coding Keys
    enum StartDateCodingKeys: String, CodingKey {
        case utc
    }
}

// MARK: Event: Decodable
extension Event: Decodable {
    public init(from decoder: Decoder) throws {
        // Root container
        let rootContainer = try decoder.container(keyedBy: CodingKeys.self)
    
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

// MARK: Event Properties Decoders
extension Event {
    private static func decodeName(from container: KeyedDecodingContainer<CodingKeys>) throws -> String {
        let nameContainer = try container.nestedContainer(keyedBy: EventNameCodingKeys.self, forKey: .name)
        return try nameContainer.decode(String.self, forKey: .text)
    }
    
    private static func decodeStartDate(from container: KeyedDecodingContainer<CodingKeys>) throws -> Date {
        // Getting nested container for start date
        let startDateContainer = try container.nestedContainer(keyedBy: StartDateCodingKeys.self, forKey: .startDate)
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
