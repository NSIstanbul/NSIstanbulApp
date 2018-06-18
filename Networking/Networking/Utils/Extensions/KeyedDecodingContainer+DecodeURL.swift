//
//  KeyedDecodingContainer+DecodeURL.swift
//  Networking
//
//  Created by Said Ozcan on 17/06/2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import Foundation

extension KeyedDecodingContainer  {
    func decodeURL(keyedBy: Key) throws -> URL? {
        let urlString = try decode(String.self, forKey: keyedBy)
        return URL(string: urlString)
    }
}
