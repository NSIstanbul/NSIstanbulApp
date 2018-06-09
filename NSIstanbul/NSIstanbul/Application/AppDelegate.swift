//
//  AppDelegate.swift
//  NSIstanbul
//
//  Created by EGEMEN AYHAN on 7.06.2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import UIKit
import PluggableApplicationDelegate

@UIApplicationMain
class AppDelegate: PluggableApplicationDelegate {
    // MARK: Properties
    private var mainWindow: UIWindow = UIWindow(frame: UIScreen.main.bounds)
    
    override var services: [ApplicationService] {
        return [
            RoutingService(window: mainWindow)
        ]
    }
}

