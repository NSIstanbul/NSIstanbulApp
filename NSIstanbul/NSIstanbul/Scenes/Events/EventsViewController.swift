//
//  EventsViewController.swift
//  NSIstanbul
//
//  Created by Ilter Cengiz on 11/6/18.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import UIKit

final class EventsViewController: UIViewController, Instantiatable {
    
    var viewModel: EventsViewModel!
    
    // MARK: View life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setupTabBarItem()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        populateUI()
    }
}

private extension EventsViewController {
    
    func setUpUI() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func populateUI() {
        
    }
    
    func setupTabBarItem() {
        tabBarItem = UITabBarItem.defaultItem(image: #imageLiteral(resourceName: "EventsUnselected"),
                                              selectedImage: #imageLiteral(resourceName: "EventsSelected"))
    }
}
