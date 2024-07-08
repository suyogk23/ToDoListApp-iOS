//
//  Item.swift
//  ToDoListApp
//
//  Created by Suyog K on 18/06/24.
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
