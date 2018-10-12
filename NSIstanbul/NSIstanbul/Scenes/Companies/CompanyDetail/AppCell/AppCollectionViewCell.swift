//
//  AppCollectionViewCell.swift
//  NSIstanbul
//
//  Created by EGEMEN AYHAN on 7.07.2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import UIKit
import Networking

class AppCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet fileprivate weak var appImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        appImageView.layer.cornerRadius = 10
        appImageView.layer.masksToBounds = true
    }
    
    // TODO: refactor
    func configure(with app: CompanyApp) {
        if let iconURL = app.iconURL {
            appImageView.af_setImage(withURL: iconURL)
        }
    }
    
}
