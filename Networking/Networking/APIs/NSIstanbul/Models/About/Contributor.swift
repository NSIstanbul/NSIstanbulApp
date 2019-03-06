//
//  Contributor.swift
//  Networking
//
//  Created by Said Ozcan on 16/06/2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import Foundation

// MARK: Contributor
public struct Contributor {
    public let order: Int
    public let name: String
    public let avatarURL: URL?
    public let externalURL: URL?
    public let isActive: Bool
}

// MARK: CodingKeys
extension Contributor {
    enum CodingKeys: String, CodingKey {
        case order
        case name
        case avatarURL = "avatar_url"
        case externalURL = "external_url"
        case isActive = "is_active"
    }
}

// MARK: Company: Decodable Protocol
extension Contributor: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Contributor.CodingKeys.self)
        order = try container.decode(Int.self, forKey: .order)
        name = try container.decode(String.self, forKey: .name)
        avatarURL = try container.decodeURL(keyedBy: .avatarURL)
        externalURL = try container.decodeURL(keyedBy: .externalURL)
        isActive = try container.decode(Bool.self, forKey: .isActive)
    }
}

