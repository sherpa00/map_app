//
//  Item.swift
//  map_app
//
//  Created by Chhewang Sherpa on 13/03/2024.
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
