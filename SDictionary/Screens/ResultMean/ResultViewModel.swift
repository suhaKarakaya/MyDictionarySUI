//
//  ResultViewModel.swift
//  SDictionary
//
//  Created by Süha Karakaya on 30.04.2024.
//

import Foundation

final class ResultViewModel: ObservableObject {
    
    @Published var tableViewList = [DetailTableViewListData]()
    @Published var atasozuVisibility = false
    @Published var birlesiklerVisibility = false
    @Published var atasozuList: [String] = []
    @Published var birlesiklerList: [String] = []
    @Published var showDetailTwo = false
    @Published var isShowLoading = false
    @Published var alertItem: AlertOneButton?
    @Published var selectButton: SelectBottomButton?

    
    func getMean(searchKey: String) {
        isShowLoading = true
        ServiceManager.shared.fetch(path: String(format: "%@%@", Constants.BASE_URL, searchKey)) { (response: [KeyDetailModel]) in
            self.isShowLoading = false
            if let list = response.first?.atasozu, !list.isEmpty {
                self.atasozuVisibility = true
                self.atasozuList = list.map({ KeyWord in
                        KeyWord.madde ?? ""
                    })
            }
            if let combinedKey = response.first?.birlesikler, combinedKey != ""{
                self.birlesiklerVisibility = true
                self.birlesiklerList = combinedKey.components(separatedBy: ", ")
            }
            
            guard let list = response.first?.anlamlarListe else { return }
            
            for item in list {
                var tempObj =  DetailTableViewListData.init(type: "", wordMean: "", wordExample: "", wordExampleAuthor: "")
                var ozellik: String = ""
                if let list = item.ozelliklerListe {
                    if !list.isEmpty {
                        for (index, element) in list.enumerated() {
                            ozellik += element.tamAdi ?? ""
                            if list.count - 1 != index {
                                ozellik += ", "
                            }
                            tempObj.type = ozellik
                        }
                    } else {
                        tempObj.type = "isim"
                    }
                } else {
                    tempObj.type = ""
                }
                tempObj.wordMean = String(format: "%@:", item.anlam ?? "")
                if let ornek = item.orneklerListe?.first?.ornek {
                    tempObj.wordExample = String(format: "%@%@%@", "\"", ornek, "\"")
                }
                if let yazarList = item.orneklerListe?.first?.yazar {
                    if !yazarList.isEmpty {
                        tempObj.wordExampleAuthor = yazarList.first?.tamAdi ?? ""
                    }
                }
                self.tableViewList.append(tempObj)
            }
        } onError: { error in
            self.isShowLoading = false
            self.alertItem = AlertContext.defaultAlert
        }
    }
    
}
