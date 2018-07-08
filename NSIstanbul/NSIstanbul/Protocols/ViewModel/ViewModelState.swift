//
//  ViewModel.swift
//  NSIstanbul
//
//  Created by Said Ozcan on 07/07/2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import Foundation

// MARK: ViewModelState
protocol ViewModelState {
    associatedtype RawModelType
    var items: [RawModelType] { get }
}
