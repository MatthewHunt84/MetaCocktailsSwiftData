//
//  DefaultIngredientSearchCell.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 7/14/24.
//

import SwiftUI

struct DefaultIngredientSearchCell: View {
   
    @EnvironmentObject var viewModel: SearchViewModel
    @Binding var ingredient: String
    
    var body: some View {
        HStack {
            
            Text(ingredient)
            
            Spacer()
            
            Image(systemName:viewModel.preferredSelections.contains(ingredient)  ? "plus.circle" : "plus.circle.fill")
                .foregroundStyle(viewModel.preferredSelections.contains(ingredient) ? ColorScheme.tintColor : ColorScheme.interactionTint)
                .onTapGesture {
                    withAnimation {
                        viewModel.handleThumbsUp(ingredient: ingredient)
                    }
                }
                .font(.system(size: 20))
            
            Image(systemName:viewModel.unwantedSelections.contains(ingredient)  ? "minus.circle" : "minus.circle.fill")
                .foregroundStyle(viewModel.unwantedSelections.contains(ingredient) ? .secondary : ColorScheme.interactionTint)
                .onTapGesture {
                    withAnimation {
                        viewModel.handleThumbsDown(ingredient: ingredient)
                    }
                }
                .padding(.horizontal, 10)
                .font(.system(size: 20))
        }
    }
}

#Preview {
    @Previewable @State var mockIngredient = "Fun Ingredient"
    DefaultIngredientSearchCell(ingredient: $mockIngredient)
        .environmentObject(SearchViewModel())
}


