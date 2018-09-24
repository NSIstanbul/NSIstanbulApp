//
//  MeetupCell.swift
//  NSIstanbul
//
//  Created by BILAL ARSLAN on 31.07.2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import UIKit

class MeetupCell: UITableViewCell, ReuseIdentifier {

    @IBOutlet fileprivate weak var containerView: UIView!
    @IBOutlet fileprivate weak var eventImageView: UIImageView!

    // MARK: Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 14
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        containerView.layer.shadowRadius = 4.0
        containerView.layer.shadowOpacity = 0.2
        containerView.layer.masksToBounds = false

        eventImageView.roundCorners(corners: [.topLeft, .topRight], radius: 14)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        containerView.backgroundColor = .white

    }

    func hideImageView(_ hidden: Bool) {
        eventImageView?.isHidden = hidden
    }
    
}
