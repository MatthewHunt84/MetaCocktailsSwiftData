//
//  AnimationModifiers.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 9/26/24.
//

import SwiftUI

struct RotatingDiscardScrollTransitionModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scrollTransition { content, phase in
                withAnimation(.easeOut) {
                    content
                        .rotation3DEffect(
                        Angle(degrees: phase.value * -50),
                        axis: (x: 0, y: 1, z: 0))
                        .opacity(1 - (phase.value * -1))
                }
            }
    }
}

extension View {
    func discardTransition() -> some View {
        self.modifier(RotatingDiscardScrollTransitionModifier())
    }
}

struct BackgroundGlowAnimation: View {
    var color: Color
    @Binding var isFavorite: Bool
    
    @State private var animationAmount: CGFloat = 0.0
    
    var body: some View {
        ZStack {
            glowColor()
                .opacity(opacity(for: animationAmount))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding(14)
                .blur(radius: 30)
        }
        .onAppear(perform: startAnimation)
        .onChange(of: isFavorite) { _, _ in
            animationAmount = 0.0
            startAnimation()
        }
    }
    
    private func startAnimation() {
        withAnimation(.easeInOut(duration: 1.8).repeatForever(autoreverses: true)) {
            animationAmount = 1.0
        }
    }
    
    private func opacity(for amount: CGFloat) -> Double {
        let minOpacity = isFavorite ? 0.14 : 0.10
        let maxOpacity = isFavorite ? 0.20 : 0.16
        return minOpacity + (maxOpacity - minOpacity) * Double(amount)
    }
    
    private func glowColor() -> Color {
        isFavorite ? color.mix(with: .red, by: 0.5) : color
    }
}
