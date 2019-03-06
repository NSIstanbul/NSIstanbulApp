//
//  NSIstanbulAboutRequest.swift
//  Networking
//
//  Created by Said Ozcan on 17/06/2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import Foundation

public struct NSIstanbulAboutRequest: NSIstanbulEndpoint {
    public typealias Response = About
    public var path: String = "/api/about/"
    public var method: HTTPMethod = .get
    
    // MARK: Lifecycle
    public init() {}
}
