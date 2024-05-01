//
//  MainView.swift
//  SDictionary
//
//  Created by Süha Karakaya on 7.03.2024.
//

import SwiftUI

struct MainView: View {

    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                if viewModel.isActive {
                    SearchView()
                } else {
                    SplashView()
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation(.snappy) {
                    viewModel.isActive = true
                }
            }
        }
    }
}

#Preview {
    MainView()
}
