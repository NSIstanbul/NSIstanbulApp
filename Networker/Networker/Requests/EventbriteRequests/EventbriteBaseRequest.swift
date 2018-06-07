//
//  EventbriteBaseRequest.swift
//  NSIstanbul
//
//  Created by Bilal Arslan on 7.06.2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import Foundation
import Alamofire

protocol EventbriteBaseRequest: BaseRequest { }

extension EventbriteBaseRequest {

    // Default implementations have to be in protocol extention.
    public var baseURL: URL                { return URL(string: "https://www.eventbriteapi.com/v3")! }
    public var method: HTTPMethod          { return .get }
    public var parameters: [String: Any]   { return [:] }
    public var headers: [String: String]?  { return nil }
    public var encoding: ParameterEncoding { return URLEncoding.default }

    // Creating request for the properties.
    public func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        guard var components = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            fatalError("API URL cannot be resolved! Check API URL and/or path for this request.")
        }

        // Create a api query Item
        let apiKeyItem = URLQueryItem(name: "api_key", value: CredentialsManager.current.eventbriteToken)

        // Add APIKey to query Items
        var queryItems = components.queryItems ?? []
        queryItems.append(apiKeyItem)
        components.queryItems = queryItems

        // Check the components for url
        guard let queriedURL = components.url else {
            fatalError("URL cannot be constructed from URL components!")
        }

        do {
            var request = URLRequest(url: queriedURL)
            request.httpMethod = method.rawValue
            request.allHTTPHeaderFields = headers
            return try encoding.encode(request, with: parameters)
        } catch {
            throw error
        }
    }

}
