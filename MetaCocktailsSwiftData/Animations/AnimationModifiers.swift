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
                content.rotation3DEffect(
                    Angle(degrees: phase.value * -50),
                    axis: (x: 0, y: 1, z: 0)
                )
            }
    }
}

extension View {
    func discardTransition() -> some View {
        self.modifier(RotatingDiscardScrollTransitionModifier())
    }
}
