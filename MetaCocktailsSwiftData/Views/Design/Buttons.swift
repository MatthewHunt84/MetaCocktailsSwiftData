//
//  UniversalBlueButton.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 9/21/24.
//

import SwiftUI
import SwiftData

struct UniversalButton: View {
    let buttonText: String
    let rightImage: Image?
    let leftImage: Image?
    let includeBorder: Bool
    let color: LinearGradient
    let action: () -> ()

    init(buttonText: String, rightImage: Image? = nil, leftImage: Image? = nil, includeBorder: Bool, color: LinearGradient = ColorScheme.nullInteractionTintGradient, action: @escaping () -> Void) {
        self.buttonText = buttonText
        self.rightImage = rightImage
        self.leftImage = leftImage
        self.includeBorder = includeBorder
        self.color = color
        self.action = action
    }
    
    var body: some View {
    
            Button {
                action()
            } label: {
                HStack {
                    if let leftNewImage = leftImage {
                        leftNewImage
                            .tint(color)
                    }
                    Text(buttonText)
                    if let rightNewImage = rightImage {
                        rightNewImage
                            .tint(color)
                    }
                }
                .font(FontFactory.mediumFont(size: 18))
                .foregroundStyle(color)
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                .background(Capsule().strokeBorder(color, lineWidth: includeBorder ? 1 : 0))
            }
            .frame(maxWidth: .infinity, alignment: .center)
        
    }
}


#Preview {
    UniversalButton(buttonText: "Enter", includeBorder: true, action: {})
}


struct FavoriteButton: View {
    let cocktail: Cocktail
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Cocktail.cocktailName) var cocktails: [Cocktail]
    
    init(for cocktail: Cocktail) {
        self.cocktail = cocktail
    }

    var body: some View {
        Button {
            withAnimation(.snappy) {
                cocktail.favorite.toggle()
                UIImpactFeedbackGenerator(style: .medium).impactOccurred()
            }
        } label: {
            Image(systemName:  cocktail.favorite ? "heart.fill" : "heart")
                .font(.system(size: 24))
                .foregroundStyle(cocktail.favorite ? ColorScheme.heartGradient : ColorScheme.nullSecondaryGradient)
                .contentTransition(
                    .symbolEffect(.replace)
                )

        }
        .sensoryFeedback(.success, trigger: cocktail.favorite)
    }
}
