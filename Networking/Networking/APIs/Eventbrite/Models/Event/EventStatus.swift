//
//  EventStatus.swift
//  Networking
//
//  Created by Said Ozcan on 14/06/2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import Foundation

public enum EventStatus: String, Codable {
    case cancelled
    case live
    case started
    case ended
    case completed
}
