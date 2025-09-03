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
    @State var disabled: Bool
    let action: () -> ()
    
    init(buttonText: String, rightImage: Image? = nil, leftImage: Image? = nil, includeBorder: Bool, color: LinearGradient = ColorScheme.nullInteractionTintGradient, disabled: Bool = false, action: @escaping () -> Void) {
        self.buttonText = buttonText
        self.rightImage = rightImage
        self.leftImage = leftImage
        self.includeBorder = includeBorder
        self.color = color
        self.disabled = disabled
        self.action = action
    }
    
    var body: some View {
        
        Button {
            action()
        } label: {
            HStack {
                if let leftNewImage = leftImage {
                    leftNewImage
                        .tint(disabledOrActiveColor())
                }
                Text(buttonText)
                if let rightNewImage = rightImage {
                    rightNewImage
                        .tint(disabledOrActiveColor())
                }
            }
            .font(FontFactory.mediumFont(size: 18))
            .foregroundStyle(disabledOrActiveColor())
            .padding(.vertical, 8)
            .padding(.horizontal, 16)
            .background(Capsule().strokeBorder(disabledOrActiveColor(), lineWidth: includeBorder ? 1 : 0))
        }
        .disabled(disabled)
        .frame(maxWidth: .infinity, alignment: .center)
        .buttonStyle(BorderlessButtonStyle())
        
        
    }
    
    func disabledOrActiveColor() -> LinearGradient {
        disabled ? ColorScheme.nullSecondaryGradient : color
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
            withAnimation(.bouncy) {
                cocktail.favorite.toggle()
                UIImpactFeedbackGenerator(style: .medium).impactOccurred()
            }
        } label: {
            Image(systemName:  cocktail.favorite ? "heart.fill" : "heart")
                .font(.system(size: 24))
                .foregroundStyle(cocktail.favorite ? ColorScheme.heartGradient : ColorScheme.nullSecondaryGradient)
        }
        .symbolEffect(.bounce.down, value: cocktail.favorite)
        .sensoryFeedback(.success, trigger: cocktail.favorite)
    }
}
