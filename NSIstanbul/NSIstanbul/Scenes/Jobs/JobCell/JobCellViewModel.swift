//
//  JobCellViewModel.swift
//  NSIstanbul
//
//  Created by Said Ozcan on 08/07/2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import Foundation
import Networking

final class JobCellViewModel {
    let positionTitle: String
    let companyName: String
    let city: String
    let url: URL?
    let companyLogoURL: URL?
    
    init?(job: Job) {
        self.positionTitle = job.positionTitle
        self.companyName = job.companyName
        self.city = job.city
        self.url = job.url
        self.companyLogoURL = job.companyLogoURL
    }
}

extension JobCellViewModel: ImageDownloadable {
    var imageURLToDownload: URL? {
        return companyLogoURL
    }
}
