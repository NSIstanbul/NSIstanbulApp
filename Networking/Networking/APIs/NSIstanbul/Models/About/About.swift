//
//  About.swift
//  Networking
//
//  Created by Said Ozcan on 16/06/2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import Foundation

struct About: Codable {
    let description: String
    let contributors: [Contributor]
}
