//
//  RootTabBarController.swift
//  NSIstanbul
//
//  Created by Said Ozcan on 09/06/2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import UIKit

final class RootTabBarController: UITabBarController, StoryboardLoadable, Instantiatable {
    // MARK: StoryboardLoadable
    static var defaultStoryboardName: String = Constants.StoryboardName.root
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: Private
    private func setup() {
        let eventsViewController = EventsController.instantiate()
        eventsViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 0)
        
        viewControllers = [eventsViewController]
    }
}
