//
//  EventsRouter.swift
//  NSIstanbul
//
//  Created by Ilter Cengiz on 11/6/18.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import UIKit

final class EventsRouter {

}

extension EventsRouter: Router {
    
    func viewController() -> UIViewController {
        let eventsViewController = EventsViewController.instantiate()
        eventsViewController.viewModel = EventsViewModel()
        return eventsViewController
    }

}
