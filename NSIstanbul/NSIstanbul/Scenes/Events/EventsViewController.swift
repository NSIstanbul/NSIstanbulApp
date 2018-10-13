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
    var loadingView = LoadingView.instantiate()
    var emptyStateView = EmptyView.instantiate()

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
        setupUI()
        setupTableView()
        populateUI()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        loadingView.center = view.center
    }
}

private extension EventsViewController {

    private func setupTabBarItem() {
        tabBarItem = UITabBarItem.defaultItem(image: #imageLiteral(resourceName: "EventsUnselected"), selectedImage: #imageLiteral(resourceName: "EventsSelected"))
    }

    func setupUI() {
        navigationController?.navigationBar.clearBackground()

        view.addSubview(loadingView)
        view.bringSubview(toFront: loadingView)
        loadingView.center = view.center
        loadingView.isHidden = true

        emptyStateView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(emptyStateView)
        view.bringSubview(toFront: emptyStateView)
        emptyStateView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        emptyStateView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        emptyStateView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        emptyStateView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        emptyStateView.isHidden = true
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
        case .fetching:
            loadingView.isHidden = false
            break
        case .updated:
            loadingView.isHidden = true
            emptyStateView.isHidden = !viewModel.state.items.isEmpty
            tableView.reloadData()
            break
        }
    }

    func handleError(errorMessage: EventsState.Error) {
        switch errorMessage {
        case .fetchFailed(let errorString):
            emptyStateView.updateLabel(string: errorString)
            emptyStateView.isHidden = false
            loadingView.isHidden = true
            break
        }
    }

}

extension EventsViewController : UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.state.items.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section > viewModel.state.items.count {
            return 0
        }
        return viewModel.state.items[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MeetupCell.reuseIdentifier, for: indexPath) as? MeetupCell else {
            return UITableViewCell()
        }
        let meetupCellViewModels: [MeetupCellViewModel] = viewModel.state.items[indexPath.section]
        cell.configure(with: meetupCellViewModels[indexPath.row])
        return cell
    }

}

extension EventsViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let cell = self.tableView.dequeueReusableHeaderFooterView(withIdentifier: "EventsHeaderView") as? EventsHeaderView else {
            return UIView()
        }
        if viewModel.state.items.count > 1 {
            switch section {
            case 0:
                cell.headerLabel.text = "Upcoming events"
                break
            case 1:
                cell.headerLabel.text = "Past events"
                break
            default:
                break
            }
        } else {
            cell.headerLabel.text = "Past events"
        }
        return cell
    }

}
