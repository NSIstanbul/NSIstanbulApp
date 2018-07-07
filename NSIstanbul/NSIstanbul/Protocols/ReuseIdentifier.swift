//
//  ReuseIdentifier.swift
//  NSIstanbul
//
//  Created by Said Ozcan on 08/07/2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import Foundation

protocol ReuseIdentifier {
    static var reuseIdentifier: String { get }
}

extension ReuseIdentifier {
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}
