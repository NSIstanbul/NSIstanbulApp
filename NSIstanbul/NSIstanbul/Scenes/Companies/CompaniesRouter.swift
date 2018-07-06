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
        
        let companiesViewController = CompaniesViewController.instantiate()
        companiesViewController.viewModel = CompaniesViewModel()
        let viewController = UINavigationController(rootViewController: companiesViewController)
        viewController.title = "Companies"
        
        // Cache view controller
        self.navigationController = viewController
        
        return viewController
    }
    
}
