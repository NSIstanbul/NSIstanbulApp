//
//  JobCell.swift
//  NSIstanbul
//
//  Created by Said Ozcan on 07/07/2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import UIKit
import AlamofireImage

class JobCell: UITableViewCell, ReuseIdentifier {
    // MARK: IBOutlets
    @IBOutlet weak var companyLogoImageView: UIImageView!
    @IBOutlet private weak var positionTitleLabel: UILabel!
    @IBOutlet private weak var companyNameLabel: UILabel!
    @IBOutlet private weak var cityNameLabel: UILabel!
    
    // MARK: Lifecycle
    override func awakeFromNib() {
        companyLogoImageView.layer.cornerRadius = companyLogoImageView.frame.width / 2
        companyLogoImageView.layer.borderWidth = 0.5
        companyLogoImageView.layer.borderColor = StyleKit.Colors.grayTwo.cgColor
        positionTitleLabel.textColor = StyleKit.Colors.blueTwo
        companyNameLabel.textColor = StyleKit.Colors.warmGrey
        cityNameLabel.textColor = StyleKit.Colors.warmGrey
    }

    func configure(viewModel: JobCellViewModel) {
        positionTitleLabel.text = viewModel.positionTitle
        companyNameLabel.text = viewModel.companyName
        cityNameLabel.text = viewModel.city
        if let logoURL = viewModel.companyLogoURL {
            companyLogoImageView.af_setImage(withURL: logoURL)
        }
    }
}
