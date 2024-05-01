//
//  SwiftUIView.swift
//  SDictionary
//
//  Created by Süha Karakaya on 30.04.2024.
//

import SwiftUI

struct DetailTwoView: View {
    @State var selectKey: String
    @State var showResultView: Bool = false
    @Binding var showDetailTwo: Bool
    @Binding var list: [String]
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(list, id: \.self) { item in
                    
                    Button{
                        selectKey = item
                        showResultView.toggle()
                    } label: {
                            HStack {
                                Text(item)
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
        .padding(.top, 10)
        .navigationDestination(isPresented: $showResultView) {
            ResultView(isShowingResult: $showResultView, title: $selectKey, showBottomButton: false)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        CustomToolbar()
                    }
                }
                .navigationBarBackground(Color.ui.sRed)
        }
    }
}

#Preview {
    DetailTwoView(selectKey: "", showDetailTwo: .constant(false), list: .constant(["suha", "ozge", "bebisbebisbebisbebisbebisbebisbebisbebisbebisbebisbebis"]))
}
