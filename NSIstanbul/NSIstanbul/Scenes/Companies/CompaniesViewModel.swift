//
//  CompaniesViewModel.swift
//  NSIstanbul
//
//  Created by EGEMEN AYHAN on 26.06.2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import Foundation
import Networking

struct CompaniesState {
    
    enum Change {
        case companiesUpdated
    }
    
    enum Error {
        case fetchFailed(String)
    }
    
    var companies: [Company] = []
    
    mutating func update(with companies: [Company]) -> CompaniesState.Change {
        self.companies = companies
        return .companiesUpdated
    }
    
}

final class CompaniesViewModel {
    
    var state = CompaniesState()
    var stateChangeHandler: ((CompaniesState.Change)->())?
    var errorHandler: ((CompaniesState.Error)->())?
    
    func loadCompanies() {
        Stubber.stubRequest(NSIstanbulCompaniesRequest(), withJSONFromFile: "NSIstanbulCompaniesResponse.json", inBundle: Bundle.main)
        let request = NSIstanbulCompaniesRequest()
        Networking.shared.execute(request: request) { [weak self] (response: Response<NSIstanbulCompaniesRequest.Response>) in
            guard let strongSelf = self else { return }
            
            switch response.result {
            case .success(let companies):
                let change = strongSelf.state.update(with: companies)
                strongSelf.stateChangeHandler?(change)
            case .failure(_):
                strongSelf.errorHandler?(.fetchFailed("Sum tin wong!"))
            }
        }
    }
    
}
