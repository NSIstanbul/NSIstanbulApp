//
//  EventsViewModel.swift
//  NSIstanbul
//
//  Created by Ilter Cengiz on 11/6/18.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import Foundation
import Networking

struct EventsState {

    enum Change {
        case eventsUpdated
    }

    enum Error {
        case fetchFailed(String)
    }

    var events: [Event] = []
    
    mutating func update(with response: [Event]) -> EventsState.Change {
        events = response
        return .eventsUpdated
    }

}

final class EventsViewModel {

    var state = EventsState()
    var stateChangeHandler: ((EventsState.Change)->())?
    var errorHandler: ((EventsState.Error)->())?

    func loadEvents() {
        // TODO: Add Events stub or request
    }

}
