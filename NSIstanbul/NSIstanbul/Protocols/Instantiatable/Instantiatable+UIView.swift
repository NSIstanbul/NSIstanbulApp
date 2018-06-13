//
//  Instantiatable+UIView.swift
//  NSIstanbul
//
//  Created by Ilter Cengiz on 11/6/18.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import UIKit

extension Instantiatable where Self: UIView {
    
    static func instantiate() -> Self {
        return load(type: self)
    }
    
    static func nib() -> UINib {
        return UINib(nibName: nibName, bundle: bundle)
    }
    
    // MARK: - Private
    
    private static var bundle: Bundle {
        return Bundle(for: self)
    }
    
    private static var nibName: String {
        return String(describing: self)
    }
    
    private static func load<T>(type: T.Type) -> T {
        let nibContents = bundle.loadNibNamed(nibName, owner: nil, options: nil)
        return nibContents?.first { $0 is T } as! T
    }
    
}
