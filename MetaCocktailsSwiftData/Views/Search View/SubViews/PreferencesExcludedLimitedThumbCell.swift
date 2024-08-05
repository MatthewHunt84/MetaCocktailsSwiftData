//
//  PreferencesExcludedLimitedThumbCell.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 8/5/24.
//

import SwiftUI

struct PreferencesExcludedLimitedThumbCell: View {
    @EnvironmentObject var viewModel: SearchViewModel
    @Binding var ingredient: String
    
    var body: some View {
        HStack{
            
            Text(ingredient)
            
            Spacer()
            
            Text("Excluded")
                .font(.caption)
                .foregroundStyle(!viewModel.unwantedSelections.contains(ingredient) ? .brandPrimaryRed : .black)
                .padding(.horizontal, 10)
                
        }
    }
}

#Preview {
   @Previewable @State var mockIngredient = "Fun Ingredient"
    PreferencesExcludedLimitedThumbCell(ingredient: $mockIngredient)
       .environmentObject(SearchViewModel())
}
