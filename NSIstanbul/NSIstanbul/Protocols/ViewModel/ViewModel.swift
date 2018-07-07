//
//  ViewModel.swift
//  NSIstanbul
//
//  Created by Said Ozcan on 07/07/2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import Foundation

protocol ViewModel {
    associatedtype ViewModelStateType = ViewModelState
    var state: ViewModelStateType { get }
    
    var stateChangehandler: ((ViewModelStateDataChange) -> ())? { get }
    var errorHandler: ((ViewModelStateError) -> ())? { get }
    
    func loadData()
}
