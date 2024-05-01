//
//  HistoryViewModel.swift
//  SDictionary
//
//  Created by Süha Karakaya on 1.05.2024.
//

import Foundation

final class HistoryViewModel: ObservableObject {
    
    @Published var alertItem: AlertTwoButton = AlertContext.historyDelete
    @Published var showResultView: Bool = false
    @Published var selectKey: String = ""
    @Published var showAlert = false
    
    
}
