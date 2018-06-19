//
//  NSIstanbulJobsRequest.swift
//  Networking
//
//  Created by Said Ozcan on 17/06/2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import Foundation

public struct NSIstanbulJobsRequest: NSIstanbulEndpoint {
    public typealias Response = [Job]
    public var path: String = "/v1/jobs"
    public var method: HTTPMethod = .get

    // MARK: Lifecycle
    public init(){}
}
