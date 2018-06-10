//
//  ApplicationDelegate.swift
//  NSIstanbul
//
//  Created by EGEMEN AYHAN on 7.06.2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import UIKit

@UIApplicationMain
class ApplicationDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // Launch UI
        App.router.presentApplication()
        
        return true
    }
}
