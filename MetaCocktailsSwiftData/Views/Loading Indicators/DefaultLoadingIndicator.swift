//
//  DefaultLoadingIndicator.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 8/27/24.
//

import SwiftUI

struct SystemLoadingOverlayModifier: ViewModifier {
    let isLoading: Bool
    
    func body(content: Content) -> some View {
        content
            .overlay {
                if isLoading {
                    systemLoadingIndicatorView()
                        .frame(width: 75, height: 75)
                        .transition(.opacity.animation(.easeOut(duration: 0.3)))
                }
            }
            .animation(.easeOut(duration: 1), value: isLoading)
    }
}

struct systemLoadingIndicatorView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle())
            .scaleEffect(1.5)
            .tint(.primary)
    }
}

extension View {
    func systemLoadingIndicator(isLoading: Bool) -> some View {
        self.modifier(SystemLoadingOverlayModifier(isLoading: isLoading))
    }
}
