//
//  Item.swift
//  Notificator
//
//  Created by Lewis on 26.01.2024.
//

import Foundation
import SwiftData

@Model
final class ItemL {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
