//
//  MeetupCellViewModel.swift
//  NSIstanbul
//
//  Created by BILAL ARSLAN on 24.09.2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import Foundation
import Networking

final class MeetupCellViewModel {
    private let eventName: String
    private let eventLocation: String
    private let eventDate: Date
    private let eventNumberOfGoing: Int
    private let eventNumberOfAvailable: Int
    private let eventImageUrl: URL?

    init?(event: Event) {
        eventName = event.name
        eventLocation = event.venue.name
        eventDate = event.startDate
        if let ticket = event.tickets.first {
            eventNumberOfGoing = ticket.quantitySold
            eventNumberOfAvailable = ticket.remainingQuantity
        } else {
            eventNumberOfGoing = 0
            eventNumberOfAvailable = 0
        }
        eventImageUrl = event.logo.originalURL
    }

    func hasImageOnEvent() -> Bool {
        return eventImageUrl != nil ? true : false
    }

    func name() -> String {
        return eventName
    }

    func location() -> String {
        return eventLocation
    }

    func day() -> String {
        return eventDate.getDay()
    }

    func month() -> String {
        return eventDate.getMonth()
    }

    func time() -> String {
        return eventDate.getEventFormattedTime()
    }

    func numberOfGoing() -> String {
        return "\(eventNumberOfGoing) going"
    }

    func numberOfAvailable() -> String {
        return "\(eventNumberOfAvailable) available"
    }

}

extension MeetupCellViewModel: ImageDownloadable {
    var imageURLToDownload: URL? {
        return eventImageUrl
    }
}
