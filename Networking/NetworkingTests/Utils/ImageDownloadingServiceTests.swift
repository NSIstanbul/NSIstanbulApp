//
//  ImageDownloadingServiceTests.swift
//  NetworkingTests
//
//  Created by EGEMEN AYHAN on 7.07.2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import XCTest
import UIKit
@testable import Networking

class ImageDownloaderTests: XCTestCase {
    
    func testImageDownloading() {
        guard let url = URL(string: "https://avatars2.githubusercontent.com/u/1969638?s=400&u=dfad50853955ddd6da0f1623bc4cebcf8665b128&v=4") else { return }
        
        let e = expectation(description: "SampleUserListRequest completes")
        var response: ImageDownloadServiceResult?
        
        let downloader = ImageDownloadingService()
        downloader.download(url: url, downloadProgressHandler: nil) { (result, url) in
            switch result {
            case .success(let image):
                XCTAssertNotNil(image)
            case .failure(let error):
                XCTFail("Request failed: \(error.localizedDescription)")
            }
            
            e.fulfill()
            response = result
        }
        
        waitForExpectations(timeout: 5)
        guard let _ = response else {
            XCTFail("Request timed out")
            return
        }
    }
    
}
