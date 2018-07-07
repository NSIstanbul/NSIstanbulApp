//
//  UITableView+ReuseIdentifier.swift
//  NSIstanbul
//
//  Created by Said Ozcan on 08/07/2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import UIKit

extension UITableView {
    func register<T: UITableViewCell>(class: T.Type) where T: ReuseIdentifier {
        register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func register<T: UITableViewCell>(nib: T.Type) where T: ReuseIdentifier {
        let nib = UINib(nibName: T.reuseIdentifier, bundle: Bundle.main)
        register(nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
}
