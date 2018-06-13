//
//  ContentViewModel.swift
//  NSIstanbul
//
//  Created by Ilter Cengiz on 11/6/18.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import Foundation
import Networking

final class ContentViewModel {
    
    let title: String
    
    init(index: Int) {
        title = "Content \(index)"
    }
    
}
