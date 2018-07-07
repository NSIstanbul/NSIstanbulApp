//
//  CompanyDetailViewModel.swift
//  NSIstanbul
//
//  Created by EGEMEN AYHAN on 7.07.2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import Foundation
import Networking

struct CompanyDetailState {
    var company: Company!
}

final class CompanyDetailViewModel {
    
    var state: CompanyDetailState!
    
    init(with company: Company) {
        state = CompanyDetailState(company: company)
    }
    
}
