//
//  Alert.swift
//  SDictionary
//
//  Created by Süha Karakaya on 1.05.2024.
//

import SwiftUI


struct AlertOneButton: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertTwoButton: Identifiable {
    let id = UUID()
    let title: String
    let message: String
    let applyButtonButton: String
    let dismissButton: String
}

struct AlertContext {
    
    static let defaultAlert = AlertOneButton(title: Text("Uyarı"),
                                             message: Text("İşleminiz sırsında bir hata oluştu"),
                                             dismissButton: .default(Text("Tamam")))
    
    static let historyDelete = AlertTwoButton(title: "Uyarı",
                                              message: "Arama geçmişini silmek istediğinizden emin misiniz?",
                                              applyButtonButton: "Evet",
                                              dismissButton: "Hayır")
    
    
}
