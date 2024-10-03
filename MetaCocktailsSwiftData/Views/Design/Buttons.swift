//
//  UniversalBlueButton.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 9/21/24.
//

import SwiftUI
import SwiftData

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
            .frame(maxWidth: .infinity, alignment: .center)
        
    }
}


#Preview {
    UniversalBlueButton(buttonText: "Enter", includeBorder: true, action: {})
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
                .font(.system(size: 20))
                .foregroundStyle(cocktail.favorite ? Color.red : Color.gray)
                .contentTransition(
                    .symbolEffect(.replace)
                )

        }
        .sensoryFeedback(.success, trigger: cocktail.favorite)
    }
}
