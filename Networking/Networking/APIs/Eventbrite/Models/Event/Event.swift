//
//  Event.swift
//  Networking
//
//  Created by Said Ozcan on 14/06/2018.
//  Copyright © 2018 Ilter Cengiz. All rights reserved.
//

import Foundation

public struct Event {
    let name: String
    let startDate: Date
    let status: EventStatus
    
    let logo: EventLogo
    let venue: EventVenue
    let tickets: [EventTicket]
    let availability: EventAvailability
}
