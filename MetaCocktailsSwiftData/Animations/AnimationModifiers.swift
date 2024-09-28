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
    @State private var isAnimating: Bool = true

    
    var body: some View {
        
        ZStack {
            
            color
                .opacity(isAnimating ? 0.16 : 0.10)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding(14)
                .blur(radius: 30)
        }
        .onAppear {
            withAnimation(.easeOut(duration: 1.8).repeatForever()) {
                isAnimating = false
            }
        }
    }
    
}
