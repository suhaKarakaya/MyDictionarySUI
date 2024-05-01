//
//  KeyWord.swift
//  SDictionary
//
//  Created by Süha Karakaya on 8.03.2024.
//

import Foundation

struct Autho: Codable {
    let madde: String?
}

struct KeyWord: Codable, Identifiable {
    var id = UUID()
    let madde: String?
}
