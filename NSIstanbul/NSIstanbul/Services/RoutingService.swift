//
//  ApplicationRouter.swift
//  NSIstanbul
//
//  Created by Said Ozcan on 09/06/2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import UIKit
import PluggableApplicationDelegate

// MARK: RoutingService
class RoutingService: NSObject {
    // MARK: Properties
    private let window: UIWindow
    
    // MARK: Lifecycle
    init(window: UIWindow) {
        self.window = window
        super.init()
    }
    
    // MARK: Public
    func retrieveRootController() -> UIViewController {
        return RootTabBarController.instantiate()
    }
}

// MARK: ApplicationService Protocol
extension RoutingService: ApplicationService {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        let rootViewController = retrieveRootController()
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        return true
    }
}
