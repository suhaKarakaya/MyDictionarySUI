//
//  UIView+Extension.swift
//  SDictionary
//
//  Created by Süha Karakaya on 8.03.2024.
//

import SwiftUI
import Foundation

extension View {
    @ViewBuilder func hidden(_ shouldHide: Bool) -> some View {
        switch shouldHide {
        case true:
            self.hidden()
        case false:
            self
        }
    }
    
    func placeholder<Content: View>(
        when _shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            
            ZStack(alignment: alignment) {
                placeholder().opacity(_shouldShow ? 1 : 0)
                self
            }
        }
    
    func navigationBarBackground(_ background: Color = .orange) -> some View {
        return self
            .modifier(ColoredNavigationBar(background: background))
    }
    
}

struct ColoredNavigationBar: ViewModifier {
    var background: Color
    
    func body(content: Content) -> some View {
        content
            .toolbarBackground(
                background,
                for: .navigationBar
            )
            .toolbarBackground(.visible, for: .navigationBar)
    }
}


