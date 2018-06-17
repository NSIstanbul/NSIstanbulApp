//
//  NSIstanbulCompaniesRequest.swift
//  Networking
//
//  Created by Said Ozcan on 17/06/2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import Foundation

public struct NSIstanbulCompaniesRequest: NSIstanbulEndpoint {
    public typealias Response = [Company]
    public var path: String = "/v1/companies"
    public var method: HTTPMethod = .get
}
