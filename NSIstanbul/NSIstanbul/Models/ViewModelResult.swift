//
//  ViewModelResult.swift
//  NSIstanbul
//
//  Created by Said Ozcan on 17/06/2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import Foundation

enum ViewModelResult<Value> {
    case success(Value)
    case failure(String)
}
