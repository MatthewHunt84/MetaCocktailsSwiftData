//
//  BlackGlassBackground.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 7/13/24.
//

import SwiftUI

struct BlackGlassBackgroundView: View {
    var body: some View {
        ZStack {
            VisualEffectView(effect: UIBlurEffect(style: .systemThickMaterialDark))
                .opacity(0.95)
            
            LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.2), Color.black.opacity(1)]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
        }
        .cornerRadius(5)
    }
}

#Preview {
    BlackGlassBackgroundView()
}

struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { uiView.effect = effect }
}
