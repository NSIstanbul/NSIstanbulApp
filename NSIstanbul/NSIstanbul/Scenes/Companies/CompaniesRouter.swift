//
//  CompaniesRouter.swift
//  NSIstanbul
//
//  Created by EGEMEN AYHAN on 26.06.2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import UIKit

final class CompaniesRouter {
    
    private var navigationController: UINavigationController?
    
}

extension CompaniesRouter: Router {
    
    func viewController() -> UIViewController {
        
        if let viewController = navigationController {
            return viewController
        }
        
        let eventsViewController = CompaniesViewController.instantiate()
        eventsViewController.viewModel = CompaniesViewModel()
        let viewController = UINavigationController(rootViewController: eventsViewController)
        viewController.title = "Companies"
        
        // Cache view controller
        self.navigationController = viewController
        
        return viewController
    }
    
}
