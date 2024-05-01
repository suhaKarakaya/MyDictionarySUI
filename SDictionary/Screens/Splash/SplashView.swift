//
//  ContentView.swift
//  SDictionary
//
//  Created by Süha Karakaya on 7.03.2024.
//

import SwiftUI

struct SplashView: View {
    
    var body: some View {
        ZStack {
            
            Image("background")
                .resizable()
            
            VStack(spacing: 30) {
                
                Image("dictionary")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.height / getSize().0, height: UIScreen.main.bounds.height / getSize().1, alignment: .center)
                
                
                Text(Bundle.main.displayName ?? "")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .foregroundColor(.white)
                    .padding()
                    .multilineTextAlignment(.center)
                    .font(.system(size: getSize().2))
                    .fontWeight(.semibold)
            }
        }
        .ignoresSafeArea()
        
    }
}

func getSize() -> (Double, Double, CGFloat) {
    switch UIDevice.current.userInterfaceIdiom {
    case .phone:
        return (2.5, 2.5, 50)
    case .pad:
        return (2, 2, 70)
    default:
        return (2.5, 2.5, 50)
    }
}


#Preview {
    SplashView()
}
