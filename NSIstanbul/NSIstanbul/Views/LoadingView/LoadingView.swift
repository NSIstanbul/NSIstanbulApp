//
//  LoadingView.swift
//  NSIstanbul
//
//  Created by BILAL ARSLAN on 25.09.2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import UIKit

class LoadingView: UIView, Instantiatable {

    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet private weak var loadingLabel: UILabel!

    override func awakeFromNib() {
        layer.cornerRadius = 5
        loadingLabel.textColor = StyleKit.Colors.deepSkyBlue
        activityIndicator.color = StyleKit.Colors.deepSkyBlue
    }

}
