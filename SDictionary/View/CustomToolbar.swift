//
//  TempView.swift
//  SDictionary
//
//  Created by Süha Karakaya on 8.03.2024.
//

import SwiftUI

struct CustomToolbar: View {
    var body: some View {
        HStack{
            Spacer()
            Text("Benim Sözlüğüm").font(.custom("Roboto-Regular", size: 28))
                .foregroundColor(Color(.white))
        }
    }
}
#Preview {
    CustomToolbar()
}
