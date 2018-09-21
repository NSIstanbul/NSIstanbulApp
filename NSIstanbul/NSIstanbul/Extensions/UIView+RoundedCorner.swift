//
//  UIView+RoundedCorner.swift
//  NSIstanbul
//
//  Created by BILAL ARSLAN on 21.09.2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import UIKit

extension UIView {

    func roundCorners(corners: UIRectCorner, radius: CGFloat){
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }

}
