//
//  About.swift
//  Networking
//
//  Created by Said Ozcan on 16/06/2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import Foundation

// MARK: About
public struct About {
    let description: String
    let contributors: [Contributor]
}

// MARK: CodingKeys
private extension About {
    enum CodingKeys {
        enum root: String, CodingKey {
            case description
            case contributors
        }
    }
}

// MARK: About: Decodable
extension About: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: About.CodingKeys.root.self)
        description = try container.decode(String.self, forKey: .description)
        contributors = try container.decode([Contributor].self, forKey: .contributors)
    }
}
