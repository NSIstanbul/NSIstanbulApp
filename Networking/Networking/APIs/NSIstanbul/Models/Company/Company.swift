//
//  Company.swift
//  Networking
//
//  Created by Said Ozcan on 16/06/2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import Foundation

// MARK: Company
public struct Company {
    public let name: String
    public let email: URL?
    public let logoURL: URL?
    public let contactURL: URL?
    public let apps: [CompanyApp]
}

// MARK: CodingKeys
private extension Company {
    enum CodingKeys: String, CodingKey {
        case name
        case email
        case logoURL = "icon_url"
        case contactURL = "contact_url"
        case apps
    }
}

// MARK: Company: Decodable Protocol
extension Company: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Company.CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        email = try container.decodeURL(keyedBy: .email)
        logoURL = try container.decodeURL(keyedBy: .logoURL)
        contactURL = try container.decodeURL(keyedBy: .contactURL)
        apps = try container.decode([CompanyApp].self, forKey: .apps)
    }
}
