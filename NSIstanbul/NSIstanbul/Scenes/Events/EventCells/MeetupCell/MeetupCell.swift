//
//  MeetupCell.swift
//  NSIstanbul
//
//  Created by BILAL ARSLAN on 31.07.2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import UIKit
import Networking

class MeetupCell: UITableViewCell, Instantiatable, ReuseIdentifier {

    @IBOutlet fileprivate weak var containerView: UIView!
    @IBOutlet fileprivate weak var eventImageView: UIImageView!
    @IBOutlet fileprivate weak var dayLabel: UILabel!
    @IBOutlet fileprivate weak var monthLabel: UILabel!
    @IBOutlet fileprivate weak var timeLabel: UILabel!
    @IBOutlet fileprivate weak var nameLabel: UILabel!
    @IBOutlet fileprivate weak var locationLabel: UILabel!
    @IBOutlet fileprivate weak var numberOfGoingLabel: UILabel!
    @IBOutlet fileprivate weak var numberOfAvailableLabel: UILabel!

    // MARK: Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 14
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        containerView.layer.shadowRadius = 4.0
        containerView.layer.shadowOpacity = 0.2
        containerView.layer.masksToBounds = false

        dayLabel.textColor = StyleKit.Colors.deepSkyBlue
        monthLabel.textColor = StyleKit.Colors.deepSkyBlue

        eventImageView.roundCorners(corners: [.topLeft, .topRight], radius: 14)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        eventImageView.roundCorners(corners: [.topLeft, .topRight], radius: 14)
        cleanFields()
    }

    func configure(with vieWModel: MeetupCellViewModel) {
        dayLabel.text = vieWModel.day()
        monthLabel.text = vieWModel.month()
        timeLabel.text = vieWModel.time()
        nameLabel.text = vieWModel.name()
        locationLabel.text = vieWModel.location()
        numberOfGoingLabel.text = vieWModel.numberOfGoing()
        numberOfAvailableLabel.text = vieWModel.numberOfAvailable()
        if vieWModel.hasImageOnEvent() {
            hideImageView(false)
            eventImageView.af_setImage(withURL: vieWModel.imageURLToDownload!)
        } else {
            hideImageView(true)
        }
    }

    func hideImageView(_ hidden: Bool) {
        eventImageView?.isHidden = hidden
        if hidden {
            eventImageView.image = nil
        }
    }

    private func cleanFields() {
        eventImageView.image = nil
        dayLabel.text = nil
        monthLabel.text = nil
        timeLabel.text = nil
        nameLabel.text = nil
        locationLabel.text = nil
        numberOfGoingLabel.text = nil
        numberOfAvailableLabel.text = nil
    }
    
}
