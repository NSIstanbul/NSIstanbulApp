//
//  EventsListResult.swift
//  Networking
//
//  Created by Said Ozcan on 14/06/2018.
//  Copyright © 2018 Ilter Cengiz. All rights reserved.
//

import Foundation

public struct EventsListResult {
    let pagination: EventPagination
    let events: [Event]
}
