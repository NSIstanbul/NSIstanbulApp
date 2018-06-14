//
//  EventPagination.swift
//  Networking
//
//  Created by Said Ozcan on 14/06/2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import Foundation

// MARK: EventPagination
public struct EventPagination: Codable {
    let objectCount: Int
    let pageNumber: Int
    let pageSize: Int
    let pageCount: Int
    let hasMoreItems: Bool
}

// MARK: EventPagination CodingKeys
private extension EventPagination {
    enum CodingKeys: String, CodingKey {
        case objectCount = "object_count"
        case pageNumber = "page_number"
        case pageSize = "page_size"
        case pageCount = "page_count"
        case hasMoreItems = "has_more_items"
    }
}
