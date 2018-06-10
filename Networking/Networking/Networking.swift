//
//  Networking.swift
//  Networking
//
//  Created by Ilter Cengiz on 22/12/17.
//  Copyright © 2017 Ilter Cengiz. All rights reserved.
//

import Foundation
import Alamofire

/// Singleton for all network operations.
public final class Networking {
    
    public static let shared = Networking()
    private let manager: SessionManager
    
    // MARK: -
    
    init() {
        manager = SessionManager()
    }
    
    // MARK: - Public functions
    
    @discardableResult
    public func execute<Request: Endpoint>(
        request: Request,
        handler: @escaping (_ response: Response<Request.Response>) -> Void) -> URLSessionTask?
    {
        let dataRequest = manager.request(request)
        dataRequest.responseData { dataResponse in
            let result: Result<Request.Response>
            switch dataResponse.result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let object = try decoder.decode(Request.Response.self, from: data)
                    result = .success(object)
                } catch let error as DecodingError {
                    result = .failure(NetworkingError.decodingFailed(error))
                } catch {
                    result = .failure(NetworkingError.undefined)
                }
            case .failure(let error):
                result = .failure(NetworkingError.connectionError(error))
            }
            handler(Response<Request.Response>(
                request: dataResponse.request,
                response: dataResponse.response,
                data: dataResponse.data,
                result: result
            ))
        }
        return dataRequest.task
    }
    
}
