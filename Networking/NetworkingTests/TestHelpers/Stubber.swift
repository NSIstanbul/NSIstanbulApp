//
//  Stubber.swift
//  NetworkingTests
//
//  Created by Ilter Cengiz on 30/12/17.
//  Copyright © 2017 Ilter Cengiz. All rights reserved.
//

import Foundation
import OHHTTPStubs

public class Stubber {
    
    public static func stubRequest<Request: Endpoint>(_ request: Request, with data: Data) {
        stub(condition: isHost(request.api.baseURL.host) && isPath(request.path)) {
            (request: URLRequest) -> OHHTTPStubsResponse in
            return OHHTTPStubsResponse(data: data,
                                       statusCode: 200,
                                       headers: nil)
        }
    }
    
    public static func stubRequest<Request: Endpoint>(_ request: Request, withJSONFromFile fileName: String) {
        stub(condition: isHost(request.api.baseURL.host) && isPath(request.path)) { (request: URLRequest) -> OHHTTPStubsResponse in
            guard let path = OHPathForFile(fileName, Stubber.self) else {
                fatalError("Could not find file with name \(fileName) to stub request \(request)")
            }
            return fixture(filePath: path, headers: nil)
        }
    }
    
    public static func stubRequest<Request: Endpoint>(_ request: Request, withJSONFromFile fileName: String, inBundle bundle: Bundle) {
        stub(condition: isHost(request.api.baseURL.host) && isPath(request.path)) {
            (request: URLRequest) -> OHHTTPStubsResponse in
            guard let path = OHPathForFileInBundle(fileName, bundle) else {
                fatalError("Could not find file with name \(fileName) to stub request \(request)")
            }
            return fixture(filePath: path, headers: nil)
        }
    }
    
}
