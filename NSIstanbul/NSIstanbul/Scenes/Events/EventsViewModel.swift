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

    typealias RawModelType = [MeetupCellViewModel]
    var items: [[MeetupCellViewModel]] = []

    enum Change {
        case fetching
        case updated
    }

    enum Error {
        case fetchFailed(String)
    }

    mutating func update(with response: [Event]) -> EventsState.Change {
        var items: [[MeetupCellViewModel]] = []
        var upcomingMeetups: [MeetupCellViewModel] = []
        var pastMeetups: [MeetupCellViewModel] = []

        let currentDate = Date()
        for event in response {
            guard let meetupCellViewModel =  MeetupCellViewModel(event: event) else {
                continue
            }
            event.startDate > currentDate ? upcomingMeetups.append(meetupCellViewModel) : pastMeetups.append(meetupCellViewModel)
        }

        if !upcomingMeetups.isEmpty {
            items.append(upcomingMeetups)
        }
        if !pastMeetups.isEmpty {
            items.append(pastMeetups)
        }

        self.items = items
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
                let change = strongSelf.state.update(with: result.events)
                strongSelf.stateChangeHandler?(change)
                break
            case .failure(let error):
                strongSelf.errorHandler?(.fetchFailed(error.localizedDescription))
                break
            }
        }
    }

}
