//
//  File.swift
//  Networking
//
//  Created by Ilter Cengiz on 03/01/18.
//  Copyright © 2018 Ilter Cengiz. All rights reserved.
//

import Foundation

/// Default endpoint implementation for Unsplash API
public protocol UnsplashEndpoint: Endpoint {}

extension UnsplashEndpoint {
    /// This implementation will save us from implementing the same `api` variable
    /// in every endpoint for Unsplash
    public var api: API {
        return API(baseURL: BaseURL(scheme: "https", host: "api.unsplash.com"))
    }
}
