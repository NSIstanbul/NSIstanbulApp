//
//  EventsViewController.swift
//  NSIstanbul
//
//  Created by Ilter Cengiz on 11/6/18.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import UIKit

final class EventsViewController: UIViewController, Instantiatable {

    var viewModel: EventsViewModel! {
        didSet {
            viewModel.stateChangeHandler = handleStateChange
            viewModel.errorHandler = handleError
        }
    }

    // MARK: View life cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupTabBarItem()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        populateUI()
    }
}

private extension EventsViewController {

    private func setupTabBarItem() {
        tabBarItem = UITabBarItem.defaultItem(image: #imageLiteral(resourceName: "EventsUnselected"), selectedImage: #imageLiteral(resourceName: "EventsSelected"))
    }

    func setUpUI() {
        navigationController?.navigationBar.clearBackground()
    }

    func populateUI() {
        viewModel.loadEvents()
    }

    func handleStateChange(change: EventsState.Change) {
        // TODO: Handle state change ex. tableView update
    }

    func handleError(errorMessage: EventsState.Error) {
        // TODO: Handle error.
    }

}
