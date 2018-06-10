//
//  PhotosRequest.swift
//  Networking
//
//  Created by Ilter Cengiz on 02/01/18.
//  Copyright © 2018 Ilter Cengiz. All rights reserved.
//

import Foundation

public struct PhotosRequest: UnsplashEndpoint {
    public typealias Response = [Photo]
    public var path: String = "/photos"
    public var method: HTTPMethod = .get
    
    public init() {}
}
