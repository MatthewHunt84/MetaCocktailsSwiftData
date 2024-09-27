//
//  RecipeButtons.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 9/27/24.
//

import SwiftUI
import SwiftData

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
                .font(.title)
                .foregroundStyle(cocktail.favorite ? Color.red : Color.gray)
                .contentTransition(
                    .symbolEffect(.replace)
                )

        }
        .sensoryFeedback(.success, trigger: cocktail.favorite)  
    }
}
