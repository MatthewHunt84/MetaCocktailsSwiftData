//
//  UniversalBlueButton.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 9/21/24.
//

import SwiftUI


struct UniversalBlueButton: View {
    let buttonText: String
    let image: Image?
    let action: () -> ()
    
    var body: some View {
        HStack {
            Spacer()
            Button {
                action()
            } label: {
                HStack {
                    Text(buttonText)
                    if let newImage = image {
                        newImage
                            .tint(ColorScheme.interactionTint)
                    }
                }
                .font(FontFactory.mediumFont(size: 18))
                .foregroundStyle(ColorScheme.interactionTint)
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                .background(Capsule().strokeBorder(ColorScheme.interactionTint, lineWidth: 1))
            }
            Spacer()
        }
    }
}


#Preview {
    UniversalBlueButton(buttonText: "Enter", image: nil, action: {})
}
