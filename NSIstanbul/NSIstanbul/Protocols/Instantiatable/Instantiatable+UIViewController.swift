//
//  Instantiatable+UIViewController.swift
//  NSIstanbul
//
//  Created by Ilter Cengiz on 11/6/18.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import UIKit

extension Instantiatable where Self: UIViewController {
    
    static func instantiate() -> Self {
        let storyboard: UIStoryboard = UIStoryboard(name: "\(self)", bundle: bundle)
        return load(type: self, from: storyboard, identifier: "\(self)")
    }
    
    // MARK: - Private
    
    private static var bundle: Bundle {
        return Bundle(for: self)
    }
    
    private static func load<T>(type: T.Type, from storyboard: UIStoryboard, identifier: String) -> T {
        return storyboard.instantiateViewController(withIdentifier: identifier) as! T
    }
    
}
