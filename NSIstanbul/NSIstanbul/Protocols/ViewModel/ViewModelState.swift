//
//  ViewModel.swift
//  NSIstanbul
//
//  Created by Said Ozcan on 07/07/2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import Foundation

// MARK: ViewModelStateDataChange
enum ViewModelStateDataChange {
    case updated
}

// MARK: ViewModelStateError
enum ViewModelStateError {
    case fetchFailed(String)
}

// MARK: ViewModelState
protocol ViewModelState {
    
    associatedtype RawModelType
    var items: [RawModelType] { get }
    
    mutating func update(with items: [RawModelType]) -> ViewModelStateDataChange
}
