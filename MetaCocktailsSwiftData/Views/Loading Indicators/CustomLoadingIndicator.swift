//
//  BasicLoadingIndicator.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 8/13/24.
//

import SwiftUI

struct CustomLoadingOverlayModifier: ViewModifier {
    let isLoading: Bool
    
    func body(content: Content) -> some View {
        content
            .overlay {
                if isLoading {
                    CustomLoadingAnimation()
                        .frame(width: 110, height: 110)
                        .transition(.opacity.animation(.easeOut(duration: 0.3)))
                }
            }
            .animation(.easeOut(duration: 1), value: isLoading)
    }
}

struct CustomLoadingAnimation: View {
    @State private var rotationCircle = 0.0
    
    var body: some View {
        
        ZStack {
                Image("CirclePart")
                    .resizable()
                    .rotationEffect(.degrees(rotationCircle))
                    .animation(Animation.linear(duration: 4).repeatForever(autoreverses: false), value: rotationCircle)
            
            Image("TrianglePart")
                .resizable()
            
            Image("GlassPart")
                .resizable()
            
        }
        .foregroundStyle(ColorScheme.tintColor)
        .task {
            await MainActor.run {
                rotationCircle = 360
            }
        }
    }
}

extension View {
    func customLoadingIndicator(isLoading: Bool) -> some View {
        self.modifier(CustomLoadingOverlayModifier(isLoading: isLoading))
    }
}
