//
//  Item.swift
//  git hub users
//
//  Created by Elvis Mwenda on 18/12/2023.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
