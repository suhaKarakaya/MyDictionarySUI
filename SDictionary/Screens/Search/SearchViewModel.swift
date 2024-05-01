//
//  SearchViewModel.swift
//  SDictionary
//
//  Created by Süha Karakaya on 8.03.2024.
//

import Foundation

final class SearchViewModel: ObservableObject {
    
    @Published var selectedKey = ""
    @Published var tfInputKey = ""
    @Published var shouldShowHistroyScreen = false
    @Published var shouldSResultScreen = false
    @Published var searchList = [KeyWord]()
    
    func getList(){
        DispatchQueue.main.async {
            let charCount = self.tfInputKey.count
            if charCount > 2 {
                self.searchList  = Constants.authoList.filter({$0.madde?.hasPrefix(self.tfInputKey) ?? false}).map({ item in
                    KeyWord(madde: item.madde)
                })
            } else {
                self.searchList = []
            }
        }
    }
    
    
    
    
}

