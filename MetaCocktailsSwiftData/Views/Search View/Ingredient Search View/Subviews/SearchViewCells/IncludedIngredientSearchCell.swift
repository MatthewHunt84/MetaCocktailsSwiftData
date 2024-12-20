//
//  IncludedIngredientSearchCell.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 8/4/24.
//

import SwiftUI

struct IncludedIngredientSearchCell: View {
    
    @EnvironmentObject var viewModel: SearchViewModel
    @Binding var ingredient: String
    
    var body: some View {
        HStack{
            
            Text(ingredient)
                .foregroundStyle(.secondary)
            
            Spacer()
            
            if !viewModel.unwantedSelections.contains(ingredient) {
                Image(systemName: "plus.circle")
                    .foregroundStyle(ColorScheme.tintColor)
                    .font(.system(size: 20))
            }
            
            Image(systemName:viewModel.unwantedSelections.contains(ingredient)  ? "minus.circle" : "minus.circle.fill")
                .foregroundStyle(viewModel.unwantedSelections.contains(ingredient)  ? .secondary : ColorScheme.interactionTint)
                .onTapGesture {
                    viewModel.handleThumbsDown(ingredient: ingredient)
                }
                .padding(.horizontal, 10)
                .font(.system(size: 20))
        }
    }
}

#Preview {
    @Previewable @State var mockIngredient = "Fun Ingredient"
    IncludedIngredientSearchCell(ingredient: $mockIngredient)
        .environmentObject(SearchViewModel())
}
