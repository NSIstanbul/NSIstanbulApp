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
    let name: String
    let avatarURL: URL?
    let externalURL: URL?
}

// MARK: CodingKeys
extension Contributor {
    enum CodingKeys: String, CodingKey {
        case name
        case avatarURL = "avatar_url"
        case externalURL = "external_url"
    }
}

// MARK: Company: Decodable Protocol
extension Contributor: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Contributor.CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        avatarURL = try container.decodeURL(keyedBy: .avatarURL)
        externalURL = try container.decodeURL(keyedBy: .externalURL)
    }
}

