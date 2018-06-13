//
//  ContentRouter.swift
//  NSIstanbul
//
//  Created by Ilter Cengiz on 11/6/18.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import UIKit

final class ContentRouter {
    
    private var contentViewController: ContentViewController?
    private let index: Int
    
    init(index: Int) {
        self.index = index
    }
    
}

extension ContentRouter: Router {
    
    func viewController() -> UIViewController {
        
        if let viewController = contentViewController {
            return viewController
        }
        
        let viewModel = ContentViewModel(index: index)
        let viewController = ContentViewController(viewModel: viewModel, router: self)
        
        // Cache view controller
        self.contentViewController = viewController
        
        return viewController
    }
}
