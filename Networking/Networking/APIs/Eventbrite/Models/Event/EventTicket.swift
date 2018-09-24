//
//  EventTicket.swift
//  Networking
//
//  Created by Said Ozcan on 14/06/2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import Foundation

// MARK: EventTicket
public struct EventTicket {
    public let quantitySold: Int
    public let remainingQuantity: Int
    public let totalQuantity: Int
}

// MARK: EventTicketAvailability
private extension EventTicket {
    enum CodingKeys: String, CodingKey {
        case quantitySold = "quantity_sold"
        case totalQuantity = "quantity_total"
    }
}

// MARK: EventTicket: Decodable
extension EventTicket: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: EventTicket.CodingKeys.self)
        
        quantitySold = try container.decode(Int.self, forKey: .quantitySold)
        totalQuantity = try container.decode(Int.self, forKey: .totalQuantity)
        remainingQuantity = totalQuantity - quantitySold
    }
}
