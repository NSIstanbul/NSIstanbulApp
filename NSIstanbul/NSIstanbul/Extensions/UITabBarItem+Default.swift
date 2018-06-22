//
//  UITabBarItem.swift
//  NSIstanbul
//
//  Created by Said Ozcan on 18/06/2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import UIKit

extension UITabBarItem {
    static func defaultItem(image: UIImage, selectedImage: UIImage) -> UITabBarItem {
        let item = UITabBarItem(title: nil, image: image, selectedImage: selectedImage)
        item.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)
        return item
    }
}
