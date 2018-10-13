//
//  EventLogo.swift
//  Networking
//
//  Created by Said Ozcan on 14/06/2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import Foundation

// MARK: EventLogo
public struct EventLogo {
    public let id: String
    public let url: URL?
    public let aspectRatio: Double
    public let originalURL: URL?
    public let size: CGSize
}

// MARK: CodingKeys
private extension EventLogo {
    enum CodingKeys {
        // MARK: EventLogo Object Coding Keys
        enum root: String, CodingKey {
            case id
            case url
            case aspectRatio = "aspect_ratio"
            case original
        }
        
        // MARK: EventLogo Original Logo Coding Keys
        enum originalLogo: String, CodingKey {
            case url
            case width
            case height
        }
    }
}

// MARK: Decodable Protocol
extension EventLogo: Decodable {
    public init(from decoder: Decoder) throws {
        // Root container
        let rootContainer = try decoder.container(keyedBy: EventLogo.CodingKeys.root.self)
        
        id = try rootContainer.decode(String.self, forKey: .id)
        url = try rootContainer.decodeURL(keyedBy: .url)
        aspectRatio = try EventLogo.decodeAspectRatio(from: rootContainer)
        
        let originalLogoContainer = try rootContainer.nestedContainer(keyedBy: EventLogo.CodingKeys.originalLogo.self, forKey: .original)
        originalURL = try originalLogoContainer.decodeURL(keyedBy: .url)
        size = try EventLogo.decodeSize(from: originalLogoContainer)
    }
}

// MARK: EventLogo Properties Decoders
private extension EventLogo {
    
    static func decodeSize(from container: KeyedDecodingContainer<EventLogo.CodingKeys.originalLogo>) throws -> CGSize {
        let width = try container.decode(Double.self, forKey: .width)
        let height = try container.decode(Double.self, forKey: .height)
        return CGSize(width: width, height: height)
    }
    
    static func decodeAspectRatio(from container: KeyedDecodingContainer<EventLogo.CodingKeys.root>) throws -> Double {
        let aspectRatioString = try container.decode(String.self, forKey: .aspectRatio)
        guard let aspectRatio = Double(aspectRatioString) else {
            let debugDescription = "EventLogo: Cannot conver aspect ratio string to double."
            throw DecodingError.dataCorruptedError(forKey: .aspectRatio,
                                                   in: container,
                                                   debugDescription: debugDescription)
        }
        return aspectRatio
    }
}
