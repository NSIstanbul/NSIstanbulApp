//
//  CompaniesViewController.swift
//  NSIstanbul
//
//  Created by EGEMEN AYHAN on 26.06.2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import UIKit
import Networking

class CompaniesViewController: UIViewController, Instantiatable {

    @IBOutlet weak var tableView: UITableView!
    var viewModel: CompaniesViewModel! {
        didSet {
            viewModel.stateChangeHandler = handleStateChange
            viewModel.errorHandler = handleError
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUI()
        populateUI()
    }

}

private extension CompaniesViewController {
    
    func setUpUI() {
        title = " "
        navigationController?.navigationBar.clearBackground()
        tableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    func populateUI() {
        viewModel.loadCompanies()
    }
    
    func handleStateChange(change: CompaniesState.Change) {
        switch change {
        case .companiesUpdated:
            tableView.reloadData()
        }
    }
    
    func handleError(errorMessage: CompaniesState.Error) {
        // TODO: Handle eroor.
    }
    
}

extension CompaniesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.state.companies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = String(describing: CompanyTableViewCell.self)
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! CompanyTableViewCell
        
        let company = viewModel.state.companies[indexPath.row]
        cell.configure(with: company)
        
        return cell
    }
    
}

extension CompaniesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let detailVC = CompanyDetailRouter.viewController(with: viewModel.state.companies[indexPath.row])
        show(detailVC, sender: self)
    }
    
}
