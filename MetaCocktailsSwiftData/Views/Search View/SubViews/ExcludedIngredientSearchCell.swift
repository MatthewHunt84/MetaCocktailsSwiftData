//
//  ExcludedIngredientSearchCell.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 8/5/24.
//

import SwiftUI

struct ExcludedIngredientSearchCell: View {
    @EnvironmentObject var viewModel: SearchViewModel
    @Binding var ingredient: String
    
    var body: some View {
        HStack{
            Text(ingredient)
                .foregroundStyle(.secondary)

            Spacer()
            
            Image(systemName: "minus.circle.fill")
                .foregroundStyle(ColorScheme.unwantedColor)
                .font(.system(size: 20))
                .padding(.horizontal, 10)
        }
    }
}

#Preview {
   @Previewable @State var mockIngredient = "Fun Ingredient"
    ExcludedIngredientSearchCell(ingredient: $mockIngredient)
       .environmentObject(SearchViewModel())
}
