//
//  SDictionaryApp.swift
//  SDictionary
//
//  Created by Süha Karakaya on 7.03.2024.
//

import SwiftUI
import SwiftData

@main
struct SDictionaryApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
        }
        .modelContainer(for: DataItem.self)
    }
}
