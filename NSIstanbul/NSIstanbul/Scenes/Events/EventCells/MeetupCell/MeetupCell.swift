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

    // MARK: Properties
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var eventImageView: UIImageView!
    @IBOutlet private weak var horizontalDivider: UIView!
    @IBOutlet private weak var dayLabel: UILabel!
    @IBOutlet private weak var monthLabel: UILabel!
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var numberOfGoingLabel: UILabel!
    @IBOutlet private weak var numberOfAvailableLabel: UILabel!
    
    // MARK: Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 14
        containerView.layer.shadowColor = UIColor.black.withAlphaComponent(0.1).cgColor
        containerView.layer.shadowOffset = .zero
        containerView.layer.shadowRadius = 16
        containerView.layer.shadowOpacity = 0.75
        containerView.layer.masksToBounds = false
        
        dayLabel.textColor = StyleKit.Colors.deepSkyBlue
        monthLabel.textColor = StyleKit.Colors.deepSkyBlue
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        cleanFields()
    }

    func configure(with viewModel: MeetupCellViewModel) {
        dayLabel.text = viewModel.day()
        monthLabel.text = viewModel.month()
        timeLabel.text = viewModel.time()
        nameLabel.text = viewModel.name()
        locationLabel.text = viewModel.location()
        numberOfGoingLabel.text = viewModel.numberOfGoing()
        numberOfAvailableLabel.text = viewModel.numberOfAvailable()
        
        if viewModel.hasImageOnEvent(), let url = viewModel.imageURLToDownload {
            hideImageView(false)
            eventImageView.af_setImage(withURL: url) { response in
                DispatchQueue.main.async { [weak self] in
                    self?.eventImageView.roundCorners(corners: [.topLeft, .topRight], radius: 14)
                }
            }
        } else {
            hideImageView(true)
        }
    }

    func hideImageView(_ hidden: Bool) {
        eventImageView.isHidden = hidden
        horizontalDivider.isHidden = hidden
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
