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
    
    @IBOutlet weak var companyImageView: UIImageView!
    @IBOutlet weak var appsCollectionView: UICollectionView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var websiteTextView: UITextView!
    @IBOutlet weak var emailTextView: UITextView!
    
    static func instantiate(with company: Company) -> CompanyDetailViewController {
        let vc = CompanyDetailViewController.instantiate()
        vc.viewModel = CompanyDetailViewModel(with: company)
        
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        populateUI()
    }
    
}

private extension CompanyDetailViewController {
    
    func setupUI() {
        companyImageView.layer.cornerRadius = companyImageView.frame.width / 2
        companyImageView.layer.borderWidth = 0.5
        companyImageView.layer.borderColor = StyleKit.Colors.imageBorder.cgColor
    }
    
    func populateUI() {
        guard let company = viewModel.state.company else { return }
        
        nameLabel.text = company.name
        websiteTextView.text = company.contactURL?.absoluteString
        emailTextView.text = company.email?.absoluteString
    }
    
}
