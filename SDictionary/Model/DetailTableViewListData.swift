//
//  DetailTableViewListData.swift
//  SDictionary
//
//  Created by Süha Karakaya on 30.04.2024.
//

import Foundation

struct DetailTableViewListData: Identifiable {
    var id = UUID()
    init(type: String,
         wordMean: String,
         wordExample: String,
         wordExampleAuthor: String) {
        self.type = type
        self.wordMean = wordMean
        self.wordExample = wordExample
        self.wordExampleAuthor = wordExampleAuthor
    }
    var type: String?
    var wordMean: String?
    var wordExample: String?
    var wordExampleAuthor: String?
}
