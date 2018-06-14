//
//  EventPagination.swift
//  Networking
//
//  Created by Said Ozcan on 14/06/2018.
//  Copyright © 2018 Ilter Cengiz. All rights reserved.
//

import Foundation

public struct EventPagination: Codable {
    // MARK: Properties
    let count: Int
    let pageNumber: Int
    let pageSize: Int
    let pageCount: Int
    let hasMoreItems: Bool
    
    // MARK: CodingKeys
    enum CodingKeys: String, CodingKey {
        case count = "object_count"
        case pageNumber
        case pageSize
        case pageCount
        case hasMoreItems
    }
}
