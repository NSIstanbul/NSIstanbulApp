//
//  Font.swift
//  NSIstanbul
//
//  Created by Said Ozcan on 18/06/2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import UIKit

extension StyleKit.Font {
    static let body = font(textStyle: .body)
    static let title1 = font(textStyle: .title1)
    static let title2 = font(textStyle: .title2)
}

// MARK: - Font creators
private extension StyleKit.Font {
    
    static func font(textStyle: UIFontTextStyle) -> UIFont {
        return UIFont.preferredFont(forTextStyle: textStyle)
    }
    
}
