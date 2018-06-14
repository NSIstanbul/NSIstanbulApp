//
//  EventTicketAvailability.swift
//  Networking
//
//  Created by Said Ozcan on 14/06/2018.
//  Copyright © 2018 Ilter Cengiz. All rights reserved.
//

import Foundation

public struct EventTicketAvailability: Codable {
    let quantitySold: Int
    let remainingQuantity: Int
    let capacity: Int
}
