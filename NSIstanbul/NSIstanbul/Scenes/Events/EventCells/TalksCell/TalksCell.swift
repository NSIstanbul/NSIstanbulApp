//
//  TalksCell.swift
//  NSIstanbul
//
//  Created by BILAL ARSLAN on 31.07.2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import UIKit

class TalksCell: UITableViewCell, ReuseIdentifier {

    @IBOutlet fileprivate weak var containerView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 14
        containerView.clipsToBounds = true
        selectionStyle = .none
    }
    
}
