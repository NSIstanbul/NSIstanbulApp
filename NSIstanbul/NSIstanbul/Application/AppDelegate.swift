//
//  AppDelegate.swift
//  NSIstanbul
//
//  Created by EGEMEN AYHAN on 7.06.2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    // MARK: Properties
    var window: UIWindow?
    var routingService: RoutingService?
    
    // MARK: UIApplicationDelegate
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        guard let window = window else { return false }
        
        routingService = RoutingService(window: window)
        routingService?.presentMainFlow()
        return true
    }
}

