//
//  NSIstanbulEndpoint.swift
//  Networking
//
//  Created by Said Ozcan on 17/06/2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import Foundation

public protocol NSIstanbulEndpoint: Endpoint {}

extension NSIstanbulEndpoint {
    public var api: API {
        return API(baseURL: BaseURL(scheme: "https", host: "nsistanbulapi.com"))
    }
}
