//
//  ContentViewController.swift
//  NSIstanbul
//
//  Created by Ilter Cengiz on 11/6/18.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import UIKit

final class ContentViewController: UIViewController {
    
    @IBOutlet private weak var label: UILabel!
    
    private let viewModel: ContentViewModel
    private weak var router: ContentRouter?
    
    // MARK: Init
    
    init(viewModel: ContentViewModel, router: ContentRouter? = nil) {
        self.viewModel = viewModel
        self.router = router
        super.init(nibName: nil, bundle: nil)
        
        title = viewModel.title
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        bindViewModel()
        populateUI()
    }
}

private extension ContentViewController {
    
    func setUpUI() {
        // Do UI customization here
        label.textColor = .blue
    }
    
    func bindViewModel() {
        // Set viewmodel handlers here
    }
    
    func populateUI() {
        label.text = viewModel.title
    }
}
