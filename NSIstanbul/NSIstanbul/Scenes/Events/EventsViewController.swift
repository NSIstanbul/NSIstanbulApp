//
//  EventsViewController.swift
//  NSIstanbul
//
//  Created by Ilter Cengiz on 11/6/18.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import UIKit

final class EventsViewController: UIViewController, Instantiatable {

     @IBOutlet private weak var tableView: UITableView!

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
        setupTableView()
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

    func setupTableView() {
        tableView.dataSource = self
        tableView.tableHeaderView = nil
        tableView.separatorStyle = .none
        tableView.register(nib: MeetupCell.self)
        tableView.register(nib: TalksCell.self)
    }

    func handleStateChange(change: EventsState.Change) {
        // TODO: Handle state change ex. tableView update
    }

    func handleError(errorMessage: EventsState.Error) {
        // TODO: Handle error.
    }

}

extension EventsViewController : UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let cell: UITableViewCell!
        if row % 2 == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: MeetupCell.reuseIdentifier, for: indexPath) as! MeetupCell
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: TalksCell.reuseIdentifier, for: indexPath) as! TalksCell
        }
        return cell
    }

}
