//
//  EmptyView.swift
//  NSIstanbul
//
//  Created by BILAL ARSLAN on 25.09.2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import UIKit

class EmptyView: UIView, Instantiatable {

    @IBOutlet private weak var emptyStateLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        emptyStateLabel.textColor = StyleKit.Colors.deepSkyBlue
        emptyStateLabel.font = StyleKit.Font.title2
    }
    func updateLabel(string: String) {
        if !string.isEmpty {
            emptyStateLabel.text = string
        }
    }

}
