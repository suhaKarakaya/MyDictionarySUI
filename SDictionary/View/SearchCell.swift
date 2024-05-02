//
//  SearchCell.swift
//  SDictionary
//
//  Created by Süha Karakaya on 8.03.2024.


import SwiftUI

struct SearchCell: View {
     
    var txtItem: String? = ""
    
    var body: some View {
        VStack {
            HStack {
                Text(txtItem ?? "")
                    .font(.custom("Roboto-Bold", size: 13))
                    .foregroundStyle(Color(.label))
                    .multilineTextAlignment(.leading)
                    //.bold()
                Spacer()
            }
            .padding(.top)
            .padding(.leading)
            Divider()
        }
        .padding(.horizontal)
  
        

    }
}

#Preview {
    SearchCell(txtItem: "Hello World")
}
