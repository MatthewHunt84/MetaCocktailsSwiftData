//
//  UniversalBlueButton.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 9/21/24.
//

import SwiftUI


struct UniversalBlueButton: View {
    let buttonText: String
    let rightImage: Image?
    let leftImage: Image?
    let includeBorder: Bool
    let action: () -> ()
    
    var body: some View {
        HStack {
            Spacer()
            Button {
                action()
            } label: {
                HStack {
                    if let leftNewImage = leftImage {
                        leftNewImage
                            .tint(ColorScheme.interactionTint)
                    }
                    Text(buttonText)
                    if let rightNewImage = rightImage {
                        rightNewImage
                            .tint(ColorScheme.interactionTint)
                    }
                }
                .font(FontFactory.mediumFont(size: 18))
                .foregroundStyle(ColorScheme.interactionTint)
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                .background(Capsule().strokeBorder(ColorScheme.interactionTint, lineWidth: includeBorder ? 1 : 0))
            }
            Spacer()
        }
    }
}


#Preview {
    UniversalBlueButton(buttonText: "Enter", rightImage: nil, leftImage: nil, includeBorder: true, action: {})
}
