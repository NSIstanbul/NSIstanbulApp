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
    let pagination: EventPagination
    let events: [Event]
}

// MARK: EventsListResult CodingKeys
private extension EventsListResult {
    // MARK: CodingKeys
    enum CodingKeys: String, CodingKey  {
        case pagination
        case events
    }
}

// MARK: EventsListResult: Decodable
extension EventsListResult: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        pagination = try container.decode(EventPagination.self, forKey: .pagination)
        events = try container.decode([Event].self, forKey: .events)
    }
}
