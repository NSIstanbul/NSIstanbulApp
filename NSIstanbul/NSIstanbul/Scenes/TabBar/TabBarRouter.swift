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
        case content1
        case content2
        case events
    }
    
    private lazy var content1Router = ContentRouter(index: 1)
    private lazy var content2Router = ContentRouter(index: 2)
    private lazy var eventsRouter = EventsRouter()
    
}

extension TabBarRouter: Router {
    
    func viewController() -> UIViewController {
        
        if let viewController = tabBarController {
            return viewController
        }
        
        let viewController = TabBarController()
        viewController.viewControllers = [
            content1Router.viewController(),
            content2Router.viewController(),
            eventsRouter.viewController()
        ]
        viewController.selectedIndex = Content.content1.rawValue
        
        // Cache view controller
        self.tabBarController = viewController
        
        return viewController
    }
    
}
