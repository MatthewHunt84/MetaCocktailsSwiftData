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
    
    init(buttonText: String, rightImage: Image? = nil, leftImage: Image? = nil, includeBorder: Bool, action: @escaping () -> Void) {
        self.buttonText = buttonText
        self.rightImage = rightImage
        self.leftImage = leftImage
        self.includeBorder = includeBorder
        self.action = action
    }
    
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
    UniversalBlueButton(buttonText: "Enter", includeBorder: true, action: {})
}
