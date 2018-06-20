//
//  TabBarRouter.swift
//  NSIstanbul
//
//  Created by Ilter Cengiz on 11/6/18.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import UIKit

final class TabBarRouter {
    
    private var tabBarController: TabBarController?
    
    private enum Content: Int {
        case events
    }
    
    private lazy var eventsRouter = EventsRouter()
    
}

extension TabBarRouter: Router {
    
    func viewController() -> UIViewController {
        
        if let viewController = tabBarController {
            return viewController
        }
        
        let viewController = TabBarController()
        viewController.viewControllers = [
            eventsRouter.viewController()
        ]
        viewController.selectedIndex = Content.events.rawValue
        
        // Cache view controller
        self.tabBarController = viewController
        
        return viewController
    }
    
}
