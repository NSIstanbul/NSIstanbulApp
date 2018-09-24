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
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.register(MeetupCell.nib(), forCellReuseIdentifier: MeetupCell.reuseIdentifier)
        tableView.register(EventsHeaderView.nib(), forHeaderFooterViewReuseIdentifier: "EventsHeaderView")
    }

    func handleStateChange(change: EventsState.Change) {
        // TODO: Handle state change ex. tableView update
        switch change {
        case .updated:
            tableView.reloadData()
        }
    }

    func handleError(errorMessage: EventsState.Error) {
        // TODO: Handle error.
    }

}

extension EventsViewController : UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.state.items.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MeetupCell.reuseIdentifier, for: indexPath) as? MeetupCell else {
            return UITableViewCell()
        }
        cell.configure(with: viewModel.state.items[indexPath.row])
        return cell
    }

}

extension EventsViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let cell = self.tableView.dequeueReusableHeaderFooterView(withIdentifier: "EventsHeaderView") as? EventsHeaderView else {
            return UIView()
        }
        cell.headerLabel.text = "Past events"
        return cell
    }

}
