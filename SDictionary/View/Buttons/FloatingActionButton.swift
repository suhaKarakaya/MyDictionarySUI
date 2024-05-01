//
//  FloatingActionButton.swift
//  SDictionary
//
//  Created by Süha Karakaya on 7.03.2024.
//

import SwiftUI

struct FloatingActionButton: View {
    
    var imageName: String
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 50, height: 50)
                .foregroundColor(Color.ui.sRed)
            Image(systemName: imageName)
                .font(.system(size: 20))
                .padding()
                .foregroundColor(.white)
        }
        .padding()
    }
}

#Preview {
    FloatingActionButton(imageName: "clock.arrow.circlepath")
}
