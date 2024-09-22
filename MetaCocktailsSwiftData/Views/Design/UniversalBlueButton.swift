//
//  UniversalBlueButton.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 9/21/24.
//

import SwiftUI


struct UniversalBlueButton: View {
    let buttonText: String
    let action: () -> ()
    
    var body: some View {
        
        Button {
            action()
        } label: {
            Text(buttonText)
                .font(FontFactory.mediumFont(size: 18))
                .foregroundStyle(ColorScheme.interactionTint)
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                .background(Capsule().strokeBorder(ColorScheme.interactionTint, lineWidth: 1))
        }
    }
}


#Preview {
    UniversalBlueButton(buttonText: "Enter", action: {})
}
