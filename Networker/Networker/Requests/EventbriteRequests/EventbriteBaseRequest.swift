//
//  EventbriteBaseRequest.swift
//  NSIstanbul
//
//  Created by Bilal Arslan on 7.06.2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import Foundation
import Alamofire

protocol EventbriteBaseRequest: BaseRequest {
    var token: String? { get }
}

extension EventbriteBaseRequest {

    // MARK: BaseRequest
    // Default implementations have to be in protocol extention.
    public var baseURL: URL                { return URL(string: "https://www.eventbriteapi.com/v3")! }
    public var method: HTTPMethod          { return .get }
    public var parameters: [String: Any]   { return [:] }
    public var headers: [String: String]?  { return nil }
    public var encoding: ParameterEncoding { return URLEncoding.default }

    // MARK: Public
    // Creating request for the properties.
    public func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        guard var components = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            fatalError("API URL cannot be resolved! Check API URL and/or path for this request.")
        }

        // Create an api query Item
        let apiKeyItem = resolveAPIKey()

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

    // MARK: Private
    private func resolveAPIKey() -> URLQueryItem {
        
        // Definitions
        let apiKey = "api_key"
        let apiKeyToken: String?
        let credentialsFile = CredentialsFile.eventbrite
        
        // Resolving token for the request
        if let token = token {
            // If we have a specific token for the request
            apiKeyToken = CredentialsManager.current.token(named: token, in: credentialsFile)
        } else {
            // If we don't have a specific token for the request falling back
            apiKeyToken = CredentialsManager.current.token(named: EventbriteEndpointToken.standard.rawValue,
                                                           in: credentialsFile)
        }
        
        return URLQueryItem(name: apiKey, value: apiKeyToken ?? "")
    }
}
