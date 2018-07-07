//
//  Job.swift
//  Networking
//
//  Created by Said Ozcan on 16/06/2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import Foundation

// MARK: Job
public struct Job {
    public let positionTitle: String
    public let companyName: String
    public let city: String
    public let url: URL?
    public let companyLogoURL: URL?
}

// MARK: CodingKeys
private extension Job {
    enum CodingKeys: String, CodingKey {
        case positionTitle = "position_title"
        case companyName = "company_name"
        case city
        case url
        case companyLogoURL = "company_logo_url"
    }
}

// MARK: Job: Decodable
extension Job: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Job.CodingKeys.self)
        positionTitle = try container.decode(String.self, forKey: .positionTitle)
        companyName = try container.decode(String.self, forKey: .companyName)
        city = try container.decode(String.self, forKey: .city)
        url = try container.decodeURL(keyedBy: .url)
        companyLogoURL = try container.decodeURL(keyedBy: .companyLogoURL)
    }
}
