//
//  ViewModel.swift
//  NSIstanbul
//
//  Created by Said Ozcan on 18/06/2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import Foundation

protocol ViewModelProtocol {
    associatedtype Value
    func loadData(completion: @escaping (ViewModelResult<Value>) -> Void)
}
