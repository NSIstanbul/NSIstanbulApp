//
//  TabBarRouter.swift
//  NSIstanbul
//
//  Created by Ilter Cengiz on 11/6/18.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import UIKit

// MARK: TabBarRouter
final class TabBarRouter {
    // MARK: Properties
    private var tabBarController: TabBarController?
    private let childRouters: [Router] = [
        EventsRouter(),
        AboutRouter()
    ]
    private enum ContentIndex: Int {
        case events = 0
    }
}

// MARK: TabBarRouter: Router
extension TabBarRouter: Router {
    func viewController() -> UIViewController {
        
        if let viewController = tabBarController {
            return viewController
        }
        
        let viewController = TabBarController()
        viewController.viewControllers = childRouters.map {$0.viewController()}
        viewController.selectedIndex = ContentIndex.events.rawValue
        
        self.tabBarController = viewController
        return viewController
    }
}
