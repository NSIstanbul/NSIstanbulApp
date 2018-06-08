//
//  DataRetrivalResult.swift
//  Networker
//
//  Created by Said Ozcan on 05/06/2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import Foundation

public enum DataRetrivalResult<T> {
    case success(T)
    case failure(Error)
}
