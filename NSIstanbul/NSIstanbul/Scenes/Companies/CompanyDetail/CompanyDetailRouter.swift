//
//  CompanyDetailRouter.swift
//  NSIstanbul
//
//  Created by EGEMEN AYHAN on 7.07.2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import Foundation
import Networking

final class CompanyDetailRouter {
    
    static func viewController(with company: Company) -> CompanyDetailViewController {
        return CompanyDetailViewController.instantiate(with: company)
    }
    
}
