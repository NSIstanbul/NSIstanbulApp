//
//  CompanyApp.swift
//  Networking
//
//  Created by Said Ozcan on 16/06/2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import Foundation

// MARK: CompanyApp
public struct CompanyApp {
    public let name: String
    public let iconURL: URL?
    public let externalURL: URL?
}

// MARK: CodingKeys
private extension CompanyApp {
    enum CodingKeys: String, CodingKey {
        case name
        case iconURL = "icon_url"
        case externalURL = "external_url"
    }
}

// MARK: CompanyApp: Decodable
extension CompanyApp: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CompanyApp.CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        iconURL = try container.decodeURL(keyedBy: .iconURL)
        externalURL = try container.decodeURL(keyedBy: .externalURL)
    }
}
