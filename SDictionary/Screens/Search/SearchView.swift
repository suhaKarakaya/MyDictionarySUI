//
//  TEmpView.swift
//  SDictionary
//
//  Created by Süha Karakaya on 7.03.2024.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject var viewModel = SearchViewModel()
    var selectedKey: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                customTextField
                searchListView
            }
            .navigationTitle("")
            .navigationBarBackground(Color.ui.sRed)
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    CustomToolbar()
                }
            }
            .navigationDestination(isPresented: $viewModel.shouldSResultScreen) {
                ResultView(isShowingResult: $viewModel.shouldSResultScreen, title: $viewModel.selectedKey, showBottomButton: true)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            CustomToolbar()
                        }
                    }
                    .navigationBarBackground(Color.ui.sRed)
            }
            .navigationDestination(isPresented: $viewModel.shouldShowHistroyScreen) {
                HistoryView()
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            CustomToolbar()
                        }
                    }
                    .navigationBarBackground(Color.ui.sRed)
            }
            .overlay(alignment: .bottomTrailing) {
                Button {
                    viewModel.shouldShowHistroyScreen.toggle()
                } label: {
                    FloatingActionButton(imageName: "clock.arrow.circlepath")
                }
            }
        }
        .accentColor(.white)
    }
    
    private var customTextField: some View {
        TextField("", text: $viewModel.tfInputKey)
            .accentColor(.sRed)
            .modifier(TextFieldClearButton(text: $viewModel.tfInputKey))
            .padding(15)
            .foregroundColor(Color(.label))
            .overlay(
                RoundedRectangle(cornerRadius: 5).strokeBorder(Color(.systemGray5), style: StrokeStyle(lineWidth: 1)))
            .placeholder(when: viewModel.tfInputKey.isEmpty) {
                Text("Ara")
                    .foregroundColor(Color(.systemGray)).padding(15)
                    .italic()
            }
            .font(Font.system(size: 15, design: .default))
            .textInputAutocapitalization(.never)
            .onChange(of: viewModel.tfInputKey) { _, _ in
                viewModel.getList()
            }
            .submitLabel(.go)
            .onSubmit {
                if !viewModel.tfInputKey.isEmpty {
                    viewModel.selectedKey = viewModel.tfInputKey
                    viewModel.shouldSResultScreen.toggle()
                }
            }
            .padding()
    }
    
    private var searchListView: some View {
        ScrollView {
            ForEach(viewModel.searchList) { key in
                Button {
                    viewModel.selectedKey = key.madde ?? ""
                    viewModel.shouldSResultScreen.toggle()
                } label: {
                    SearchCell(txtItem: key.madde)
                }
            }
        }
    }
}

#Preview {
    SearchView().preferredColorScheme(.light)
    //    SearchView().preferredColorScheme(.dark)
}



