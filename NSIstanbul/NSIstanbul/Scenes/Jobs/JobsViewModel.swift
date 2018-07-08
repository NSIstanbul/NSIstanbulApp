//
//  JobsViewModel.swift
//  NSIstanbul
//
//  Created by Said Ozcan on 07/07/2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import Networking

struct JobsState: ViewModelState {
    
    enum Change {
        case updated
    }
    
    enum Error {
        case fetchFailed(String)
    }
    
    typealias RawModelType = JobCellViewModel
    var items: [JobCellViewModel] = []
    
    mutating func update(with items: [JobCellViewModel]) -> JobsState.Change {
        self.items = items
        return .updated
    }
}

final class JobsViewModel {
    
    var state: JobsState = JobsState()
    var stateChangehandler: ((JobsState.Change) -> ())?
    var errorHandler: ((JobsState.Error) -> ())?
    
    func loadData() {
        Stubber.stubRequest(NSIstanbulJobsRequest(), withJSONFromFile: "NSIstanbulJobsResponse.json", inBundle: Bundle.main)
        let request = NSIstanbulJobsRequest()
        Networking.shared.execute(request: request) { [weak self] (response: Response<NSIstanbulJobsRequest.Response>) in
            guard let strongSelf = self else { return }
            
            switch response.result {
            case .success(let jobs):
                let jobsViewModels = jobs.compactMap { JobCellViewModel(job: $0) }
                let change = strongSelf.state.update(with: jobsViewModels)
                strongSelf.stateChangehandler?(change)
            case .failure(let error):
                strongSelf.errorHandler?(.fetchFailed(error.localizedDescription))
            }
        }
        
    }
    
}
