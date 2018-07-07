//
//  CompanyDetailViewController.swift
//  NSIstanbul
//
//  Created by EGEMEN AYHAN on 7.07.2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import UIKit
import Networking

class CompanyDetailViewController: UIViewController, Instantiatable {

    var viewModel: CompanyDetailViewModel!
    
    static func instantiate(with company: Company) -> CompanyDetailViewController {
        let vc = CompanyDetailViewController.instantiate()
        vc.viewModel = CompanyDetailViewModel(with: company)
        
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }

    @IBAction func backTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}

private extension CompanyDetailViewController {
    
    func setupUI() {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
}
