//
//  HistoryView.swift
//  SDictionary
//
//  Created by Süha Karakaya on 7.03.2024.
//

import SwiftUI
import SwiftData

struct HistoryView: View {
    
    @StateObject var viewModel = HistoryViewModel()
    
    @Environment (\.modelContext) private var context
    
    @Query private var items: [DataItem]
    
    var body: some View {
        
        VStack {
            ScrollView {
                ForEach(items, id: \.self) { item in
                    Button{
                        viewModel.selectKey = item.key
                        viewModel.showResultView.toggle()
                    } label: {
                        HStack {
                            Text(item.key)
                                .foregroundStyle(Color.ui.sRed)
                                .fontWeight(.medium)
                                .underline()
                                .padding(.bottom, 5)
                                .padding(.horizontal)
                                .multilineTextAlignment(.leading)
                            Spacer()
                        }
                    }
                }
            }
        }
        .overlay(alignment: .bottom) {
            VStack {
                Button {
                    viewModel.showAlert.toggle()
                } label: {
                    Text("Temizle")
                        .font(.subheadline)
                        .modifier(DetailButtonViewModifier())
                }
            }
            .padding()
        }
        .navigationDestination(isPresented: $viewModel.showResultView) {
            ResultView(isShowingResult: $viewModel.showResultView, title: $viewModel.selectKey, showBottomButton: true)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        CustomToolbar()
                    }
                }
                .navigationBarBackground(Color.ui.sRed)
        }
        .alert(viewModel.alertItem.title, isPresented: $viewModel.showAlert, presenting: viewModel.alertItem) { article in
            Button(viewModel.alertItem.applyButtonButton) {
                deleteList()
            }
            Button(viewModel.alertItem.dismissButton, role: .cancel) {}
        } message: {article in
            Text(article.message)
        }
        .padding(.top, 10)
    }
    
    func deleteList() {
        for item in items {
            context.delete(item)
        }
    }
}

#Preview {
    HistoryView()
}
