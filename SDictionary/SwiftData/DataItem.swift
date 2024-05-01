//
//  DataItem.swift
//  SDictionary
//
//  Created by Süha Karakaya on 1.05.2024.
//

import Foundation
import SwiftData

@Model
class DataItem: Identifiable {
    var id: String
    var key: String
    
    init(key: String) {
        self.id = UUID().uuidString
        self.key = key
    }
    
}

