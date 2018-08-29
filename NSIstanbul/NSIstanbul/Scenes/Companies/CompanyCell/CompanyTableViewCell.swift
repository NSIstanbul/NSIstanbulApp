//
//  CompanyTableViewCell.swift
//  NSIstanbul
//
//  Created by EGEMEN AYHAN on 2.07.2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import UIKit
import Networking
import AlamofireImage

class CompanyTableViewCell: UITableViewCell {

    @IBOutlet weak var companyImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        companyImageView.layer.cornerRadius = companyImageView.frame.width / 2
        companyImageView.layer.borderWidth = 0.5
        companyImageView.layer.borderColor = UIColor(displayP3Red: 206/255, green: 206/255, blue: 206/255, alpha: 1.0).cgColor
    }
    
    func configure(with company: Company) {
        nameLabel.text = company.name
        if let logoURL = company.logoURL {
            companyImageView.af_setImage(withURL: logoURL)
        }
    }
}
