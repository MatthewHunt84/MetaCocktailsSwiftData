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
                    content.rotation3DEffect(
                        Angle(degrees: phase.value * -50),
                        axis: (x: 0, y: 1, z: 0)
                    )
                }
            }
    }
}

extension View {
    func discardTransition() -> some View {
        self.modifier(RotatingDiscardScrollTransitionModifier())
    }
}

struct DelayedBackgroundGlowAnimation: View {
    
    var color: Color
    @State var durationAndDelay: CGFloat = 1.0
    
    @State var trigger: Bool = false
    @State private var isAnimating: Bool = false
    
    var body: some View {
        
        ZStack {
            color
                .opacity(trigger ? 1 : 0)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .blur(radius: 20)
        }
        .task {
            
            try? await Task.sleep(for: .milliseconds(200))
            trigger = true
            
            try? await Task.sleep(for: .milliseconds(100))
            withAnimation(.easeOut(duration: 0.1)) {
                trigger = false
            }
        }
    }
}

struct BackgroundGlowAnimation: View {
    
    var color: Color
    
    @State var trigger: Bool = false
    @State private var isAnimating: Bool = false
    
    var body: some View {
        
        ZStack {
            color
                .opacity(trigger ? 0.15 : 0.05)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .blur(radius: 20)
        }
        .task {
            trigger = true
            
            try? await Task.sleep(for: .milliseconds(100))
            withAnimation(.easeOut(duration: 1)) {
                trigger = false
            }
        }
    }
}
