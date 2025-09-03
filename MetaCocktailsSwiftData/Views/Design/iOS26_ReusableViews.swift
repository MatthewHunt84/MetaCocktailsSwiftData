//
//  iOS26_ReusableViews.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 7/24/25.
//
import SwiftUI
import SwiftData

@available(iOS 26.0, *)
struct iOS26_FavoriteButton: View {
    let cocktail: Cocktail
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Cocktail.cocktailName) var cocktails: [Cocktail]
    
    init(for cocktail: Cocktail) {
        self.cocktail = cocktail
    }

    var body: some View {
        Button(action: {
            withAnimation(.snappy) {
                cocktail.favorite.toggle()
                UIImpactFeedbackGenerator(style: .medium).impactOccurred()
            }
        }) {
            Image(systemName:  cocktail.favorite ? "heart.fill" : "heart")
                .font(.system(size: 22))
                .foregroundStyle(cocktail.favorite ? ColorScheme.heartGradient : ColorScheme.nullSecondaryGradient)
        }
        .padding(10)
        .glassEffect(.clear, in: Circle())
        .sensoryFeedback(.success, trigger: cocktail.favorite)
    }
}
