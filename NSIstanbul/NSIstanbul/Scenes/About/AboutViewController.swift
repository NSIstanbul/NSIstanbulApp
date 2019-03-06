//
//  AboutViewController.swift
//  NSIstanbul
//
//  Created by Said Ozcan on 08/07/2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import UIKit

final class AboutViewController: UIViewController {
    // MARK: IBOutlets
    // MARK: Properties
    private let viewModel: AboutViewModel
    private weak var router: AboutRouter?
    
    // MARK: Lifecycle
    init(viewModel: AboutViewModel, router: AboutRouter) {
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
        populateUI()
    }
}

// MARK: AboutViewController Private Methods
extension AboutViewController {
    private func setupTabBarItem() {
        tabBarItem = UITabBarItem.defaultItem(image: #imageLiteral(resourceName: "AboutUnselected"),
                                              selectedImage: #imageLiteral(resourceName: "AboutSelected"))
    }
    
    private func setupUI() {}
    
    private func populateUI() {
        viewModel.loadData()
    }
    
    private func setupViewModel() {
        viewModel.stateChangehandler = handleStateChange
        viewModel.errorHandler = handleError
    }
    
    func handleStateChange(change: AboutState.Change) {}
    
    func handleError(errorMessage: AboutState.Error) {}
}
