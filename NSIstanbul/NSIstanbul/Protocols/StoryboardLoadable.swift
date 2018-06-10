//
//  StoryboardLoadable.swift
//  NSIstanbul
//
//  Created by Ilter Cengiz on 19/02/2017.
//  Copyright © 2017 Ilter Cengiz. All rights reserved.
//

import UIKit

protocol StoryboardLoadable {
    static var defaultStoryboardName: String { get }
    static var defaultViewControllerIdentifier: String { get }
    static func loadFromStoryboard() -> Self
}

extension StoryboardLoadable where Self: UIViewController {
    
    static var defaultViewControllerIdentifier: String {
        return String(describing: self)
    }
    
    static func loadFromStoryboard() -> Self {
        let storyboard = UIStoryboard(name: defaultStoryboardName, bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: defaultViewControllerIdentifier) as? Self else {
            fatalError("[StoryboardLoadable] Cannot instantiate view controller from storyboard.")
        }
        return viewController
    }
}
