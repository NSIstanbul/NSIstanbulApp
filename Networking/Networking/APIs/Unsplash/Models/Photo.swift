//
//  Photo.swift
//  Networking
//
//  Created by Ilter Cengiz on 30/12/17.
//  Copyright © 2017 Ilter Cengiz. All rights reserved.
//

import Foundation

public enum PhotoSize {
    case raw
    case full
    case regular
    case small
    case thumb
}

public struct Photo {
    let photoID: String
    let width: Float
    let height: Float
    let likes: Int
    //let user: User! // TODO
    let rawURL: URL
    let fullURL: URL
    let regularURL: URL
    let smallURL: URL
    let thumbURL: URL
}
    
extension Photo: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case photoID = "id"
        case width, height, likes, user, urls
    }
    
    enum URLsCodingKeys: String, CodingKey {
        case raw, full, regular, small, thumb
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let photoID = try container.decode(String.self, forKey: .photoID)
        let width = try container.decode(Float.self, forKey: .width)
        let height = try container.decode(Float.self, forKey: .height)
        let likes = try container.decode(Int.self, forKey: .likes)
        
        let urlsContainer = try container.nestedContainer(keyedBy: URLsCodingKeys.self, forKey: .urls)
        let rawURL = try urlsContainer.decode(URL.self, forKey: .raw)
        let fullURL = try urlsContainer.decode(URL.self, forKey: .full)
        let regularURL = try urlsContainer.decode(URL.self, forKey: .regular)
        let smallURL = try urlsContainer.decode(URL.self, forKey: .small)
        let thumbURL = try urlsContainer.decode(URL.self, forKey: .thumb)
        
        self.init(photoID: photoID,
                  width: width,
                  height: height,
                  likes: likes,
                  rawURL: rawURL,
                  fullURL: fullURL,
                  regularURL: regularURL,
                  smallURL: smallURL,
                  thumbURL: thumbURL)
    }

}
