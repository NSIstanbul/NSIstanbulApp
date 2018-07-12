//
//  AboutRouter.swift
//  NSIstanbul
//
//  Created by Said Ozcan on 08/07/2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import UIKit

// MARK: AboutRouter
final class AboutRouter {
    private var navigationController: UINavigationController?
}

// MARK: AboutRouter: Router
extension AboutRouter: Router {
    func viewController() -> UIViewController {
        
        if let viewController = navigationController {
            return viewController
        }
        
        let viewModel = AboutViewModel()
        let jobsViewController = AboutViewController(viewModel: viewModel, router: self)
        
        let viewController = UINavigationController(rootViewController: jobsViewController)
        viewController.title = "Events"
        
        // Cache view controller
        self.navigationController = viewController
        
        return viewController
    }
}
