//
//  ApplicationRouter.swift
//  NSIstanbul
//
//  Created by Ilter Cengiz on 11/6/18.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import UIKit

class ApplicationRouter {
    
    private let window = UIWindow(frame: UIScreen.main.bounds)
    private lazy var tabBarRouter = TabBarRouter()
    
    func presentApplication() {
        window.rootViewController = tabBarRouter.viewController()
        window.makeKeyAndVisible()
    }
    
}
