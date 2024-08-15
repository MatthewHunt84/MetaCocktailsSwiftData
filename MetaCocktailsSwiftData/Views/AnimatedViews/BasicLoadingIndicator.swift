//
//  BasicLoadingIndicator.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 8/13/24.
//

import SwiftUI

extension View {
    func basicLoadingIndicator(isLoading: Bool) -> some View {
        self.modifier(LoadingOverlayModifier(isLoading: isLoading))
    }
}

struct LoadingOverlayModifier: ViewModifier {
    let isLoading: Bool
    
    func body(content: Content) -> some View {
        content
            .overlay {
                if isLoading {
                    LoadingAnimation2()
                        .frame(width: 75, height: 75)
                        .transition(.opacity.animation(.easeOut(duration: 0.3)))
                }
            }
            .animation(.easeOut(duration: 1), value: isLoading)
    }
}

struct LoadingAnimation2: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle())
            .scaleEffect(1.5)
            .tint(.white)
    }
}

extension View {
    func funLoadingIndicator(isLoading: Bool) -> some View {
        self.modifier(LoadingOverlayModifier2(isLoading: isLoading))
    }
}

struct LoadingOverlayModifier2: ViewModifier {
    let isLoading: Bool
    
    func body(content: Content) -> some View {
        content
            .overlay {
                if isLoading {
                    LoadingAnimation()
                        .frame(width: 110, height: 110)
                        .transition(.opacity.animation(.easeOut(duration: 0.3)))
                }
            }
            .animation(.easeOut(duration: 1), value: isLoading)
    }
}
