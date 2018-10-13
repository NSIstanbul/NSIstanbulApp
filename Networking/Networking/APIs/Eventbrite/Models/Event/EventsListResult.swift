//
//  EventsListResult.swift
//  Networking
//
//  Created by Said Ozcan on 14/06/2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import Foundation

// MARK: EventsListResult
public struct EventsListResult {
    public let pagination: EventPagination
    public let events: [Event]
}

// MARK: EventsListResult CodingKeys
private extension EventsListResult {
    // MARK: Root Keys
    enum CodingKeys: String, CodingKey  {
        case pagination
        case events
    }
}

// MARK: EventsListResult: Decodable
extension EventsListResult: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: EventsListResult.CodingKeys.self)
        pagination = try container.decode(EventPagination.self, forKey: .pagination)
        events = try container.decode([Event].self, forKey: .events)
    }
}
