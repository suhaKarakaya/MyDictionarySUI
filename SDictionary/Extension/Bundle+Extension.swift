//
//  Bundle+Extension.swift
//  SDictionary
//
//  Created by Süha Karakaya on 1.05.2024.
//

import Foundation

extension Bundle {
    var displayName: String? {
        return object(forInfoDictionaryKey: "CFBundleDisplayName") as? String
    }
}
