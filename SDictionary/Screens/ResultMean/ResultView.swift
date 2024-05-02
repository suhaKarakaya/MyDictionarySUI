//
//  ResultView.swift
//  SDictionary
//
//  Created by Süha Karakaya on 7.03.2024.
//

import SwiftUI
import SwiftData

struct ResultView: View {
    
    @Environment (\.modelContext) private var context
    
    @Query private var items: [DataItem]
    
    @StateObject var viewModel = ResultViewModel()
    
    @Binding var isShowingResult: Bool
    @Binding var title: String
    
    var showBottomButton: Bool
    
    var body: some View {
        
        ZStack {
            ProgressView()
                .scaleEffect(1.5)
                .hidden(!viewModel.isShowLoading)
            VStack {
                HStack {
                    Text(title)
                        .fontWeight(.bold)
                        .italic()
                        .font(.title)
                        .foregroundStyle(Color.ui.sRed)
                    Spacer()
                }
                .padding()
                
                ScrollView {
                    ForEach(viewModel.tableViewList) { mean in
                        VStack (alignment: .leading, spacing: 10) {
                            if !(mean.type?.isEmpty ?? false)  {
                                Text(mean.type ?? "")
                                    .fontWeight(.medium)
                                    .foregroundStyle(Color.ui.sRed)
                                    .italic()
                            }
                            
                            if !(mean.wordMean?.isEmpty ?? false) {
                                Text(mean.wordMean ?? "")
                            }
                            
                            if !(mean.wordExample?.isEmpty ?? false) {
                                Text(mean.wordExample ?? "")
                                    .italic()
                            }
                            if !(mean.wordExampleAuthor?.isEmpty ?? false) {
                                Text(mean.wordExampleAuthor ?? "")
                                    .fontWeight(.medium)
                            }
                            
                            Divider()
                        }
                        .padding(.horizontal)
                    }
                }.padding(.bottom, showBottomButton ? (viewModel.atasozuVisibility && viewModel.birlesiklerVisibility ? 140 : 80) : 0)
                
            }
            .navigationDestination(isPresented: $viewModel.showDetailTwo) {
                DetailTwoView(selectKey: "", showDetailTwo: $viewModel.showDetailTwo, list: viewModel.selectButton == .atasozu ? $viewModel.atasozuList : $viewModel.birlesiklerList)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            CustomToolbar()
                        }
                    }
                    .navigationBarBackground(Color.ui.sRed)
            }
            .overlay(alignment: .bottom) {
                if showBottomButton {
                    VStack {
                        if viewModel.atasozuVisibility {
                            Button {
                                viewModel.showDetailTwo.toggle()
                                viewModel.selectButton = .atasozu
                            } label: {
                                Text("Atasözleri, Deyimler, Birleşik Filller veya Kalıp Sözler")
                                    .font(.subheadline)
                                    .modifier(DetailButtonViewModifier())
                            }
                        }
                        
                        if viewModel.birlesiklerVisibility {
                            Button {
                                viewModel.selectButton = .birlesikler
                                viewModel.showDetailTwo.toggle()
                            } label: {
                                Text("Birleşik Kelimeler")
                                    .font(.subheadline)
                                    .modifier(DetailButtonViewModifier())
                            }
                        }
                    }
                    .padding()
                }
            }
            .onAppear {
                viewModel.getMean(searchKey: title)
            }
        }        
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
        .disabled(viewModel.isShowLoading)
        .onAppear{
            if !items.contains(where: { $0.key.elementsEqual(title) }) {
                addItem(searchKey: title)
            }
        }
    }
    
    func addItem(searchKey: String) {
        let item = DataItem(key: searchKey)
        context.insert(item)
    }
}

#Preview {
    ResultView(isShowingResult: .constant(false), title: .constant("baba"), showBottomButton: false)
}
enum SelectBottomButton {
    case atasozu
    case birlesikler
}
