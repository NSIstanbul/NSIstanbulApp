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
    
    @IBOutlet fileprivate weak var companyImageView: UIImageView!
    @IBOutlet fileprivate weak var appsCollectionView: UICollectionView!
    @IBOutlet fileprivate weak var nameLabel: UILabel!
    @IBOutlet fileprivate weak var websiteTextView: UITextView!
    @IBOutlet fileprivate weak var emailTextView: UITextView!
    
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

// MARK: - Private Functions
private extension CompanyDetailViewController {
    
    func setupUI() {
        companyImageView.layer.cornerRadius = companyImageView.frame.width / 2
        companyImageView.layer.borderWidth = 0.5
        companyImageView.layer.borderColor = StyleKit.Colors.imageBorder.cgColor
        
    }
    
    func populateUI() {
        let company = viewModel.state.company
        
        nameLabel.text = company.name
        websiteTextView.text = company.contactURL?.absoluteString
        emailTextView.text = company.email?.absoluteString
        if let companyLogoURL = company.logoURL {
            companyImageView.af_setImage(withURL: companyLogoURL)
        }
    }
    
}

// MARK: - UICollectionViewDataSource
extension CompanyDetailViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = String(describing: AppCollectionViewCell.self)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! AppCollectionViewCell
        
        let app = viewModel.state.company.apps[indexPath.row]
        cell.configure(with: app)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.state.company.apps.count
    }
    
}

// MARK: - UICollectionViewDelegate
extension CompanyDetailViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // TODO: open app url in safari
    }
    
}
