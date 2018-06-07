//
//  RequestManager.swift
//  NSIstanbul
//
//  Created by Bilal Arslan on 7.06.2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import Foundation
import Alamofire

public class RequestManager {

    private let manager: SessionManager

    public init() {
        manager = SessionManager()
    }

    @discardableResult public func perform(_ request: BaseRequest, handleCompletion: @escaping () -> Void) -> DataRequest? {
        let dataRequest = manager.request(request)
        dataRequest.responseData { (dataResponse: DataResponse<Data>) in
            switch dataResponse.result {
            case .success(let value):
                //                handleCompletion(DataRetrivalResult.success(value))
                print("\(value)")
            case .failure(let error):
                //                handleCompletion(DataRetrivalResult.success(error))
                print("\(error.localizedDescription)")
            }
        }
        return dataRequest
    }
}
