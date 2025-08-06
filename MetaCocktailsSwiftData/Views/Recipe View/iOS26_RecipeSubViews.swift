//
//  iOS26_RecipeSubViews.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 7/24/25.
//

import SwiftUI

@available(iOS 26.0, *)
struct iOS26_FlipCardNavigationHeader: View {
    
    @Environment(\.dismiss) private var dismiss
    var viewModel: RecipeViewModel
    var body: some View {
        VStack(spacing: 0) {
            
            HStack {
                
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "chevron.backward")
                        .font(.system(size: 24))
                        .foregroundStyle(ColorScheme.interactionTint)
                        .padding(10)
                }
                .glassEffect(.clear, in: Circle())

                Spacer()
                
                iOS26_FavoriteButton(for: viewModel.cocktail)
            }
        }
    }
}
