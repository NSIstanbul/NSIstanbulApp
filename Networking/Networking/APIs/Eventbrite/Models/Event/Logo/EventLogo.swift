//
//  EventLogo.swift
//  Networking
//
//  Created by Said Ozcan on 14/06/2018.
//  Copyright © 2018 Ilter Cengiz. All rights reserved.
//

import Foundation

// MARK: EventLogo
public struct EventLogo {
    let id: String
    let url: URL?
    let aspectRatio: Double
    let originalURL: URL?
    let size: CGSize
}

// MARK: CodingKeys
extension EventLogo {
    // MARK: EventLogo Object Coding Keys
    enum CodingKeys: String, CodingKey {
        case id
        case url
        case aspectRatio
        case original
    }
    
    // MARK: EventLogo Original Logo Coding Keys
    enum EventLogoOriginalLogoCodingKeys: String, CodingKey {
        case url
        case width
        case height
    }
}

// MARK: Decodable Protocol
extension EventLogo: Decodable {
    public init(from decoder: Decoder) throws {
        // Root container
        let rootContainer = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try rootContainer.decode(String.self, forKey: .id)
        url = try EventLogo.decodeURL(from: rootContainer, keyedBy: .url)
        aspectRatio = try rootContainer.decode(Double.self, forKey: .aspectRatio)
        
        let originalLogoContainer = try rootContainer.nestedContainer(keyedBy: EventLogoOriginalLogoCodingKeys.self, forKey: .original)
        originalURL = try EventLogo.decodeURL(from: originalLogoContainer, keyedBy: .url)
        size = try EventLogo.decodeSize(from: originalLogoContainer)
    }
}

// MARK: EventLogo Properties Decoders
extension EventLogo {
    private static func decodeURL<KeyedByType: CodingKey>(from container: KeyedDecodingContainer<KeyedByType>, keyedBy: KeyedByType) throws -> URL? {
        let urlString = try container.decode(String.self, forKey: keyedBy)
        return URL(string: urlString)
    }
    
    private static func decodeSize(from container: KeyedDecodingContainer<EventLogoOriginalLogoCodingKeys>) throws -> CGSize {
        let width = try container.decode(Double.self, forKey: .width)
        let height = try container.decode(Double.self, forKey: .height)
        return CGSize(width: width, height: height)
    }
}
