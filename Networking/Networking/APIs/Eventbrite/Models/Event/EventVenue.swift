//
//  EventVenue.swift
//  Networking
//
//  Created by Said Ozcan on 14/06/2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import Foundation
import CoreLocation

// MARK: EventVenue
public struct EventVenue {
    let name: String
    let coordinates: CLLocationCoordinate2D
    let address: String
}

// MARK: EventVenue Coding Keys
private extension EventVenue {
    enum CodingKeys {
        // MARK: Root Keys
        enum root: String, CodingKey {
            case name
            case address
            case latitude
            case longitude
        }
        
        // MARK: AddressCodingKeys
        enum address: String, CodingKey {
            case address = "localized_address_display"
        }
    }
}

// MARK: EventVenue: Decodable
extension EventVenue: Decodable {
    public init(from decoder: Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: EventVenue.CodingKeys.root.self)
        
        name = try rootContainer.decode(String.self, forKey: .name)
        coordinates = try EventVenue.decodeLocation(from: rootContainer)
        address = try EventVenue.decodeAddress(from: rootContainer)
    }
}

// MARK: EventVenue Properties Decoders
private extension EventVenue {
    static func decodeLocation(from container: KeyedDecodingContainer<EventVenue.CodingKeys.root>) throws -> CLLocationCoordinate2D {
        let latitudeString = try container.decode(String.self, forKey: .latitude)
        let longitudeString = try container.decode(String.self, forKey: .longitude)
        
        guard let latitude = Double(latitudeString) else {
            let debugDescription = "EventVenue: Cannot convert latitude string to double."
            throw DecodingError.dataCorruptedError(forKey: .latitude,
                                                   in: container,
                                                   debugDescription: debugDescription)
        }
        
        guard let longitude = Double(longitudeString) else {
            let debugDescription = "EventVenue: Cannot convert longitude string to double."
            throw DecodingError.dataCorruptedError(forKey: .longitude,
                in: container,
                debugDescription: debugDescription)
        }
        
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    static func decodeAddress(from container: KeyedDecodingContainer<EventVenue.CodingKeys.root>) throws -> String {
        let addressContainer = try container.nestedContainer(keyedBy: EventVenue.CodingKeys.address.self, forKey: .address)
        return try addressContainer.decode(String.self, forKey: .address)
    }
}
