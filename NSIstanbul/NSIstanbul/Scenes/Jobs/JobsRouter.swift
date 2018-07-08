//
//  JobsRouter.swift
//  NSIstanbul
//
//  Created by Said Ozcan on 07/07/2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import UIKit
import Networking
import SafariServices

// MARK: JobsRouter
final class JobsRouter {
    private var navigationController: UINavigationController?
}

// MARK: Internal Routing
extension JobsRouter {
    func open(jobItemURL: URL) {
        let safariVC = SFSafariViewController(url: jobItemURL)
        navigationController?.present(safariVC, animated: true)
    }
}

// MARK: JobsRouter: Router
extension JobsRouter: Router {
    func viewController() -> UIViewController {
        
        if let viewController = navigationController {
            return viewController
        }
        
        let viewModel = JobsViewModel()
        let imageDownloadingService = ImageDownloadingService()
        let jobsViewController = JobsViewController(viewModel: viewModel, router: self, imageDownloadingService: imageDownloadingService)
        
        let viewController = UINavigationController(rootViewController: jobsViewController)
        viewController.title = "Events"
        
        // Cache view controller
        self.navigationController = viewController
        
        return viewController
    }
}
