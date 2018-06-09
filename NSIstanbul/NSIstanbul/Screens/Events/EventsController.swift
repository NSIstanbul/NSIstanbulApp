//
//  EventsController.swift
//  NSIstanbul
//
//  Created by Said Ozcan on 09/06/2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import UIKit

final class EventsController: UIViewController, StoryboardLoadable, Instantiatable {
    
    // MARK: StoryboardLoadable
    static var defaultStoryboardName: String = Constants.StoryboardName.events
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
