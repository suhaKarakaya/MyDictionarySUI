//
//  MainViewModel.swift
//  SDictionary
//
//  Created by Süha Karakaya on 8.03.2024.
//

import Foundation

final class MainViewModel: ObservableObject {
    
    @Published var isActive: Bool = false
    
    init() {
        Task(priority: .background) {
            let res = await JsonToModelConvert.shared.convertJson(typeModel: [Autho].self)
            switch res {
            case.success(let response):
                Constants.authoList = response
                break
            case.failure(let error):
                debugPrint(error)
                break
            }
        }

    }
    
}
