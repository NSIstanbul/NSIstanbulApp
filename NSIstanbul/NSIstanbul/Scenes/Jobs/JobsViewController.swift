//
//  JobsViewController.swift
//  NSIstanbul
//
//  Created by Said Ozcan on 07/07/2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import UIKit
import Networking
import SafariServices

// MARK: JobsViewController
final class JobsViewController: UIViewController, Instantiatable {
    // MARK: Properties
    private let viewModel: JobsViewModel
    private weak var router: JobsRouter?
    
    // MARK: IBOutlets
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: Lifecycle
    init(viewModel: JobsViewModel, router: JobsRouter) {
        self.viewModel = viewModel
        self.router = router
        super.init(nibName: nil, bundle: nil)
        setupTabBarItem()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupViewModel()
        setupTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        activityIndicator.startAnimating()
        viewModel.loadData()
    }
}

// MARK: JobsViewController Private Methods
extension JobsViewController {
    private func setupTabBarItem() {
        tabBarItem = UITabBarItem.defaultItem(image: #imageLiteral(resourceName: "JobsUnselected"),
                                              selectedImage: #imageLiteral(resourceName: "JobsSelected"))
    }
    
    private func setupUI() {
        titleLabel.font = StyleKit.Font.title1
        titleLabel.textColor = StyleKit.Colors.deepSkyBlue
        activityIndicator.hidesWhenStopped = true
        navigationController?.navigationBar.clearBackground()
    }
    
    private func setupViewModel() {
        viewModel.stateChangehandler = handleStateChange
        viewModel.errorHandler = handleError
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableHeaderView = nil
        tableView.register(nib: JobCell.self)
    }
    
    func handleStateChange(change: JobsState.Change) {
        switch change {
        case .updated:
            tableView.reloadData()
        }
    }
    
    func handleError(errorMessage: JobsState.Error) {
        print(errorMessage)
    }
}

// MARK: JobsViewController: UITableViewDataSource
extension JobsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.state.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: JobCell.reuseIdentifier, for: indexPath) as! JobCell
        
        let jobViewModel = viewModel.state.items[indexPath.row]
        cell.configure(viewModel: jobViewModel)
        
        return cell
    }
}

// MARK: JobsViewController: UITableViewDelegate
extension JobsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedItem = viewModel.state.items[indexPath.row]
        if let url = selectedItem.url {
            router?.open(jobItemURL: url)
        }
    }
}
