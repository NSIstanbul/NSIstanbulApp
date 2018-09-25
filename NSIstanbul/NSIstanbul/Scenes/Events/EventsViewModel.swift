//
//  EventsViewModel.swift
//  NSIstanbul
//
//  Created by Ilter Cengiz on 11/6/18.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import Foundation
import Networking

struct EventsState: ViewModelState {

    typealias RawModelType = MeetupCellViewModel
    var items: [MeetupCellViewModel] = []

    enum Change {
        case fetching
        case updated
    }

    enum Error {
        case fetchFailed(String)
    }

    mutating func update(with response: [MeetupCellViewModel]) -> EventsState.Change {
        items = response
        return .updated
    }

}

final class EventsViewModel {

    var state = EventsState()
    var stateChangeHandler: ((EventsState.Change)->())?
    var errorHandler: ((EventsState.Error)->())?

    func loadEvents() {
        stateChangeHandler?(.fetching)
        let request = EventbriteEventsRequest()
        Networking.shared.execute(request: request) { [weak self] (response: Response<EventbriteEventsRequest.Response>) in
            guard let strongSelf = self else { return }

            switch response.result {
            case .success(let result):
                let meetupCellViewModels = result.events.compactMap { MeetupCellViewModel(event: $0) }
                let change = strongSelf.state.update(with: meetupCellViewModels)
                strongSelf.stateChangeHandler?(change)
                break
            case .failure(let error):
                strongSelf.errorHandler?(.fetchFailed(error.localizedDescription))
                break
            }
        }
    }

}
