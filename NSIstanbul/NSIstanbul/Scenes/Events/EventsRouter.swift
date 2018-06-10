//
//  EventsRouter.swift
//  NSIstanbul
//
//  Created by Ilter Cengiz on 11/6/18.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import UIKit

final class EventsRouter {
    
    private var navigationController: UINavigationController?
    
}

extension EventsRouter: Router {
    
    func viewController() -> UIViewController {
        
        if let viewController = navigationController {
            return viewController
        }
        
        let eventsViewController = EventsViewController.instantiate()
        eventsViewController.viewModel = EventsViewModel()
        let viewController = UINavigationController(rootViewController: eventsViewController)
        viewController.title = "Events"
        
        // Cache view controller
        self.navigationController = viewController
        
        return viewController
    }
}
