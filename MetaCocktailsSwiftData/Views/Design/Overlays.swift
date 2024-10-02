//
//  Overlays.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 10/1/24.
//

import SwiftUI

struct ClearButtonModifier: ViewModifier {
    @Binding var text: String
    let isEmbeddedInSection: Bool
    var action: () -> Void
    
    func body(content: Content) -> some View {
        content
            .overlay(alignment: .trailing) {
                if !text.isEmpty {
                    Button(action: action) {
                        Image(systemName: "x.circle")
                            .tint(ColorScheme.interactionTint)
                            .bold()
                            .font(.system(size: 18))
                            .frame(width: 60, height: 40, alignment: .trailing)
                            .contentShape(Rectangle())
                            .padding(.trailing, isEmbeddedInSection ? 0 : 16)
                    }
                }
            }
    }
}

extension View {
    func clearSearchButton(text: Binding<String>, isEmbeddedInSection: Bool = false, action: @escaping () -> Void) -> some View {
        self.modifier(ClearButtonModifier(text: text, isEmbeddedInSection: isEmbeddedInSection, action: action))
    }
}
