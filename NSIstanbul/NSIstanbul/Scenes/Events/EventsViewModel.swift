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

    typealias RawModelType = Event
    var items: [Event] = []

    enum Change {
        case eventsUpdated
    }

    enum Error {
        case fetchFailed(String)
    }

    mutating func update(with response: [Event]) -> EventsState.Change {
        items = response
        return .eventsUpdated
    }

}

final class EventsViewModel {

    var state = EventsState()
    var stateChangeHandler: ((EventsState.Change)->())?
    var errorHandler: ((EventsState.Error)->())?

    func loadEvents() {
        let request = EventbriteEventsRequest()
        Networking.shared.execute(request: request) { [weak self] (response: Response<EventbriteEventsRequest.Response>) in
            guard let strongSelf = self else { return }

            switch response.result {
            case .success(let result):
                let events = result.events
                let change = strongSelf.state.update(with: events)
                strongSelf.stateChangeHandler?(change)
                break
            case .failure(let error):
                strongSelf.errorHandler?(.fetchFailed(error.localizedDescription))
                break
            }
        }
    }

}
