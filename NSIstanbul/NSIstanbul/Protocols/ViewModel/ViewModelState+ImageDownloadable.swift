//
//  ViewModelState+ImageDownloadable.swift
//  NSIstanbul
//
//  Created by Said Ozcan on 07/07/2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import Foundation

extension ViewModelState where RawModelType: ImageDownloadable {
    func imageURL(at indexPath:IndexPath) -> URL? {
        let item = self.items[indexPath.row]
        return item.imageURLToDownload
    }
    
    func imageUrls(for indexPaths:[IndexPath]) -> [URL] {
        var urls : [URL] = []
        for indexPath in indexPaths {
            if let url = self.imageURL(at: indexPath) {
                urls.append(url)
            }
        }
        return urls
    }
}
