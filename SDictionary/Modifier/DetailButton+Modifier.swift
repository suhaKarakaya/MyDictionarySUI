//
//  DetailButton+Modifier.swift
//  SDictionary
//
//  Created by Süha Karakaya on 30.04.2024.
//

import SwiftUI

struct DetailButtonViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .foregroundStyle(.white)
            .font(.subheadline)
            .fontWeight(.semibold)
            .background(Color.ui.sRed)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}
