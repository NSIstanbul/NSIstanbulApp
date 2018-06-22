//
//  UINavigationBar+Clear.swift
//  NSIstanbul
//
//  Created by Said Ozcan on 18/06/2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import UIKit

extension UINavigationBar {
    func clearBackground() {
        setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        shadowImage = UIImage()
    }
}
