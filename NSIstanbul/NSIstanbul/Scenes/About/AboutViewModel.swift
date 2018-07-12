//
//  AboutViewModel.swift
//  NSIstanbul
//
//  Created by Said Ozcan on 08/07/2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import Foundation
import Networking

struct AboutContributorsState {
    
}

struct AboutState: ViewModelState {
    
    enum Change {
        case updated
    }
    
    enum Error {
        case fetchFailed(String)
    }
    
    typealias RawModelType = Contributor
    var items: [Contributor] = []
    
    mutating func update(with about: About) -> AboutState.Change {
        self.items = about.contributors
        return .updated
    }
}

final class AboutViewModel {
    
    var state: AboutState = AboutState()
    var stateChangehandler: ((AboutState.Change) -> ())?
    var errorHandler: ((AboutState.Error) -> ())?
    
    func loadData() {
        Stubber.stubRequest(NSIstanbulAboutRequest(), withJSONFromFile: "NSIstanbulAboutResponse.json", inBundle: Bundle.main)
        let request = NSIstanbulAboutRequest()
        Networking.shared.execute(request: request) { [weak self] (response: Response<NSIstanbulAboutRequest.Response>) in
            guard let strongSelf = self else { return }
            
            switch response.result {
            case .success(let about):
                let change = strongSelf.state.update(with: about)
                strongSelf.stateChangehandler?(change)
            case .failure(let error):
                strongSelf.errorHandler?(.fetchFailed(error.localizedDescription))
            }
        }
        
    }
    
}
