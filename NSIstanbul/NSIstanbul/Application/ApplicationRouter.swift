//
//  ApplicationRouter.swift
//  NSIstanbul
//
//  Created by Said Ozcan on 09/06/2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import UIKit

class ApplicationRouter: NSObject {
    // MARK: Properties
    private let window: UIWindow
    
    // MARK: Lifecycle
    init(window: UIWindow) {
        self.window = window
        super.init()
    }
    
    // MARK: Public
    func presentMainFlow() {
        let rootTabBarController = RootTabBarController.instantiate()
        window.rootViewController = rootTabBarController
        window.makeKeyAndVisible()
    }
}
